class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :details
      t.datetime :end_time
      t.integer :reserve_price

      t.timestamps
    end
  end
end
