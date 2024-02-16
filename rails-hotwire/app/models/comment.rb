# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :todo

  validates :description,
            presence: true
end
