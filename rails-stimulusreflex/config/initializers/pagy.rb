# frozen_string_literal: true

require 'pagy/extras/items'
require 'pagy/extras/overflow'

Pagy::VARS[:max_items] = 100
Pagy::VARS[:items_param] = :per_page
Pagy::VARS[:overflow] = :last_page
Pagy::VARS[:items] = 10
