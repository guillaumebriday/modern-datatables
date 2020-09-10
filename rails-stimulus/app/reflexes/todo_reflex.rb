# frozen_string_literal: true

class TodoReflex < ApplicationReflex
  def toggle
    todo = Todo.find(element.dataset[:id])

    todo.update(completed: !todo.completed?)
  end

  def submit
    @todo = Todo.new(todo_params)
    @todo.valid?
  end

  def search
    session[:description] = element.value
  end

  private

  def todo_params
    params
      .require(:todo)
      .permit(
        :description,
        :completed
      )
  end
end
