# frozen_string_literal: true

class Api::V1::TodosController < Api::V1::BaseController
  before_action :set_todo, only: %i[show update]

  def index
    pagy, todos = pagy Todo.by_description(params[:description]).order(created_at: :desc)

    render json: TodoSerializer.new(todos, links: pagy_metadata(pagy))
  end

  def show
    render json: TodoSerializer.new(@todo)
  end

  def create
    todo = Todo.new(todo_params)

    if todo.save
      render json: TodoSerializer.new(todo), status: :created
    else
      render json: { error: todo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    @todo.attributes = todo_params

    if @todo.save
      render json: TodoSerializer.new(@todo)
    else
      render json: { error: @todo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params
      .require(:todo)
      .permit(
        :description,
        :completed
      )
  end
end
