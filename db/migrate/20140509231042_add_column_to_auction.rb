class AddColumnToAuction < ActiveRecord::Migration
  def change 
    add_column :auctions, :price, :integer
  end
end
