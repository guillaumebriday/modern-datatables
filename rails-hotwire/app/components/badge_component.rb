# frozen_string_literal: true

class BadgeComponent < ApplicationComponent
  def initialize(id: nil, classes: nil, value: nil, variant: nil) # rubocop:disable Lint/MissingSuper
    @id = id
    @classes = classes
    @value = value
    @variant = variant
  end

  def call
    tag.span(
      @value,
      id: @id,
      class: class_names(
        'inline-block text-xs text-center px-2 py-1 align-middle rounded-md font-semibold ring-1 ring-inset',
        @classes,
        colors
      )
    )
  end

  private

  def colors
    return if @variant.blank?

    {
      secondary: 'bg-gray-100 text-gray-800 ring-gray-200',
      danger: 'bg-red-100 text-red-800 ring-red-200',
      warning: 'bg-yellow-100 text-yellow-800 ring-yellow-200',
      success: 'bg-green-100 text-green-800 ring-green-200',
      info: 'bg-blue-100 text-blue-800 ring-blue-200'
    }[@variant.to_sym]
  end
end
