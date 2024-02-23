# frozen_string_literal: true

class Todo < ApplicationRecord
  include Sortable

  after_update_commit { broadcast_replace_to 'todos', partial: 'todos/todo', locals: { todo: self } }

  has_many :comments, dependent: :destroy

  validates :description,
            uniqueness: true,
            presence: true

  scope :order_by_created_at, ->(direction = :asc) { order(created_at: direction) }
  scope :order_by_description, ->(direction = :asc) { order(description: direction) }
  scope :order_by_completed, ->(direction = :asc) { order(completed: direction) }
  scope :by_description, ->(description) {
    return if description.blank?

    where(arel_table[:description].matches("%#{description}%"))
  }

  scope :by_completed, ->(completed) {
    return if completed.nil?

    where(completed: completed)
  }
end
