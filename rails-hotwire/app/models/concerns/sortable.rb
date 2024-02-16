# frozen_string_literal: true

module Sortable
  extend ActiveSupport::Concern

  included do
    def self.apply_sort(params)
      sort = params[:sort]

      return all if sort.blank?

      direction = :asc

      if sort.start_with?('-')
        sort = sort[1..]
        direction = :desc
      end

      scope = "order_by_#{sort}"

      return send(scope, direction) if respond_to?(scope)

      all
    end
  end
end
