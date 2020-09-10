# frozen_string_literal: true

class TodoSerializer
  include FastJsonapi::ObjectSerializer

  attributes :description, :completed
end
