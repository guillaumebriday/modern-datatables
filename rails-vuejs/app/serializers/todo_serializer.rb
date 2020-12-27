# frozen_string_literal: true

class TodoSerializer
  include JSONAPI::Serializer

  attributes :description, :completed
end
