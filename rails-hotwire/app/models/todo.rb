# frozen_string_literal: true

class Todo < ApplicationRecord
  after_update_commit { broadcast_replace_to 'todos', partial: 'todos/todo', locals: { todo: self } }

  validates :description,
            uniqueness: true,
            presence: true

  scope :by_description, ->(description) {
    return if description.blank?

    where(arel_table[:description].matches("%#{description}%"))
  }

  scope :by_completed, ->(completed) {
    return if completed.nil?

    where(completed: completed)
  }
end
