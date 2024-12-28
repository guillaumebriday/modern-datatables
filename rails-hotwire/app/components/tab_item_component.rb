# frozen_string_literal: true

class TabItemComponent < ApplicationComponent
  def initialize(options = {}) # rubocop:disable Lint/MissingSuper
    @options = options

    @path = @options.delete(:path)
    @name = @options.delete(:name)
    @count = @options.delete(:count)
    @active = @options.delete(:active) { true }
  end

  def call
    helpers.link_to(
      @path,
      class: class_names('flex gap-2 whitespace-nowrap border-b-2 py-3 px-1 text-sm font-medium', extra_class),
      data: { turbo_action: 'replace' }
    ) do
      concat(@name)
      concat(helpers.badge_tag(variant: @active ? :info : :secondary, value: @count))
    end
  end

  private

  def extra_class
    return 'border-blue-500 text-blue-600' if @active

    'border-transparent text-gray-500 hover:border-gray-200 hover:text-gray-700'
  end
end
