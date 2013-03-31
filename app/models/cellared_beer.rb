class CellaredBeer < ActiveRecord::Base
  attr_accessible :beer_id
  belongs_to :beer
  belongs_to :user
end
