class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.text :desc
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip
      t.integer :type
      t.string :web
      t.string :facebook
      t.string :twitter
      t.string :email
      t.string :phone

      t.timestamps
    end

    add_index :breweries, :name
    add_index :breweries, :state
    add_index :breweries, :country
    add_index :breweries, :zip
    add_index :breweries, :type
  end
end
