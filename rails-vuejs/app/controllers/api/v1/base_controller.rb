# frozen_string_literal: true

class Api::V1::BaseController < ActionController::API
  include Pagy::Backend
end
