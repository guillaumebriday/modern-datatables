# frozen_string_literal: true

require 'pagy/extras/metadata'
require 'pagy/extras/limit'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:limit_max] = 100
Pagy::DEFAULT[:limit_param] = :per_page
# Pagy::DEFAULT[:metadata] = %i[count page prev next last]
Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT[:items] = 10
