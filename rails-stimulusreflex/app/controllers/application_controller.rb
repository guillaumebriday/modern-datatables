# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  protected

  def redirect_to_js(location)
    render js: "Turbolinks.visit('#{location}')"
  end
end
