# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :todo, touch: true

  validates :description,
            presence: true
end
