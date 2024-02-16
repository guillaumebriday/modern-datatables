# frozen_string_literal: true

module ComponentsHelper
  UI_HELPERS = {
    tab_component: TabComponent,
    badge_tag: BadgeComponent
  }.freeze

  UI_HELPERS.each do |name, component|
    define_method name do |*args, **kwargs, &block|
      render component.new(*args, **kwargs), &block
    end
  end
end
