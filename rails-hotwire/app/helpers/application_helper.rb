# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def permitted_params
    params.slice(:page, :per_page).permit!.to_h
  end
end
