require "spec_helper"
  describe BidsController do 
    let(:auction) { create(:auction) }
    describe "#create" do 
      def valid_request
          post :create, auction_id: auction.id, bid: { amount: "some valid amount" }
      end
        it "creates a bid on the auction" do 
          expect do 
            valid_request
          end.to change{ auction.bids.count }.by(1)
          
        end
        it "assigns the bid to the auction" do
          valid_request
          expect(Bid.last.auction).to eq(auction)
        end
        context "with invalid request" do
          def invalid_request
            post :create, auction_id: auction.id, bid: { amount: "" }
          end
          it "doesn't create a bid in the database" do 
            expect { invalid_request }.to_not change {Bid.count}
          end
         

        end
    end

  
end