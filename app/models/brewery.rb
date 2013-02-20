class Breweries < ActiveRecord::Base
  attr_accessible :address, :city, :country, :desc, :email, :facebook, :name, :phone, :state, :twitter, :type, :web, :zip
end
