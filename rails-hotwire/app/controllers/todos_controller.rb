# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update toggle_completed]

  def index
    params[:sort] ||= '-created_at'

    @title = 'Todos'
    @pagy, @todos = pagy Todo
                    .by_description(params[:description])
                    .by_completed(params[:completed])
                    .apply_sort(params)

    set_counts
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

    set_counts
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_counts
    @all_count = Todo.async_count
    @completed_count = Todo.by_completed(true).async_count
    @in_progress_count = Todo.by_completed(false).async_count
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
