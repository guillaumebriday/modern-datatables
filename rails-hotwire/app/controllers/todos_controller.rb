# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update toggle_completed]

  def index
    @title = 'Todos'
    @pagy, @todos = pagy Todo.by_description(params[:description]).order(created_at: :desc)
  end

  def new
    @title = 'Create todo'
    @todo = Todo.new
  end

  def edit
    @title = 'Edit todo'
  end

  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@todo, partial: 'todos/form') }
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_path notice: 'Todo was successfully updated.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@todo, partial: 'todos/form') }
        format.html { render :edit }
      end
    end
  end

  def toggle_completed
    @todo.update(completed: !@todo.completed?)

    render turbo_stream: turbo_stream.replace(@todo, partial: 'todos/todo',
                                                     locals: { todo: @todo, todo_counter: params[:todo_counter]&.to_i })
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
