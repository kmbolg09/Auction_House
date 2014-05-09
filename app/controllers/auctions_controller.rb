class AuctionsController < ApplicationController
before_action :find_auction, only: [:edit, :show, :update, :destroy]



def index
  @auctions = Auction.all 
  
end

def new 
  @auction = Auction.new
  
end

def create
  @auction = Auction.new(auction_params)
  if @auction.save
    redirect_to @auction, notice: "Auction created."
  else
  render :new
  end
end  

def edit 
  
end

def show 
  @bid = Bid.new
  @bids = @auction.bids
  
end

def update
  if @auction.update_attributes(auction_params)
    redirect_to @auction, notice: "Auction updated"
  else
    render :edit
  end
end

def destroy
  @auction.destroy
  redirect_to auctions_path, notice: "Auction deleted"
end




private

def auction_params
  params.require(:auction).permit(:title, :details, :end_time, :reserve_price, :price)
end

def find_auction
  @auction = Auction.find(params[:id])
end

end
