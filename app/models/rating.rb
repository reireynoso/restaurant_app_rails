class Rating < ApplicationRecord
    belongs_to :dish
    belongs_to :user
end
