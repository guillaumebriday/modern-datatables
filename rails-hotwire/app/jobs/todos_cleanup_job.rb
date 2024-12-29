# frozen_string_literal: true

class TodosCleanupJob < ApplicationJob
  def perform
    Todo.where(completed: true, created_at: ..2.years.ago).destroy_all
  end
end
