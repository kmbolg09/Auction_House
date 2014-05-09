class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.references :auction, index: true
      t.timestamps
    end
  end
end
