class BidsController < ApplicationController
  before_action :find_auction
  

  def create
    @bid = @auction.bids.new(bid_params)
    if@bid.save
      redirect_to @bid.auction
    else

      redirect_to @bid.auction, notice: "You didn't bid high enough"
  
    end
  end

  


  

  private


    
   

    def bid_params
      params.require(:bid).permit(:amount)
    end

    def find_auction
      @auction = Auction.find params[:auction_id]
    end

    def find_bid
      @bid = Bid.find params[:id]
    end  
   

end
