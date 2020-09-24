class Review < ApplicationRecord
    belongs_to :product, optional: true
end
