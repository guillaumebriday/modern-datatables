# frozen_string_literal: true

class TabComponent < ApplicationComponent
  renders_many :items, TabItemComponent

  def render?
    items.any?
  end

  def call
    tag.div(class: 'border-b border-gray-200 mb-3') do
      tag.nav(class: '-mb-px flex gap-8') do
        safe_join(items)
      end
    end
  end
end
