# frozen_string_literal: true

require 'pagy/extras/items'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:max_items] = 100
Pagy::DEFAULT[:items_param] = :per_page
Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT[:items] = 10
