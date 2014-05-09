class Bid < ActiveRecord::Base
belongs_to :auction

validates :amount, presence: true
scope :ordered_by_creation, -> { order("created_at DESC") }
#validates_numericality_of :amount, :greater_than => Bid.last.amount
validate :check_if_highest_bid

  after_save :update_auction
  after_destroy :update_auction

  def update_auction
    self.auction.check_highest_bid
  end     

  def check_if_highest_bid
     errors.add(:amount, "must be higher than current bid") unless self.auction.reserve_price < self.amount
  end
end



#validate :bid_is_higher_than_current_highest
#private 

#def bid_is_higher_That_current_highest
#  bid > auction.current_highest_bid
#end