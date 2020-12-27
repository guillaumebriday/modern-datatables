# frozen_string_literal: true

class Todo < ApplicationRecord
  validates :description,
            uniqueness: true,
            presence: true

  scope :by_description, ->(description) {
    return if description.blank?

    where(arel_table[:description].matches("%#{description}%"))
  }
end
