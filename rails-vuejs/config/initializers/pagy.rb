# frozen_string_literal: true

require 'pagy/extras/metadata'
require 'pagy/extras/items'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:max_items] = 100
Pagy::DEFAULT[:items_param] = :per_page
# Pagy::DEFAULT[:metadata] = %i[count page prev next last]
Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT[:items] = 10
