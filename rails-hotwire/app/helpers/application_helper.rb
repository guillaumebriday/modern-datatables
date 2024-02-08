# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def options_for_completed_status
    options_for_select([
      ['All', nil],
      ['Completed', true],
      ['In progress', false]
    ])
  end
end
