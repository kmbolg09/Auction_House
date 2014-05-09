class Auction < ActiveRecord::Base
has_many :bids
validates :title, presence: true
def check_highest_bid
    highest_bid = self.bids.order("amount DESC").first.amount rescue 0
    self.reserve_price = highest_bid
    save
  end


end
