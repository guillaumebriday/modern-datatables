# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update]

  def index
    @title = 'Todos'
    @pagy, @todos = pagy Todo.by_description(session[:description]).order(created_at: :desc)
  end

  def new
    @title = 'Create todo'
    @todo ||= Todo.new
  end

  def edit
    @title = 'Edit todo'
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      flash[:notice] = 'Todo was successfully created.'
      redirect_to_js todos_path
    else
      render :new
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to_js todos_path
    else
      render :edit
    end
  end

  private

  def set_todo
    @todo ||= Todo.find(params[:id])
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
