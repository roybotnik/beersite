class Beer < ActiveRecord::Base
  attr_accessible :abv, :brewery, :desc, :ibu, :name, :style
end
