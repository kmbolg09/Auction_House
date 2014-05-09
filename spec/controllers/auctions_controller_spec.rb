require "spec_helper"

describe AuctionsController do 
  let(:auction) { create(:auction) }

  describe "#index" do
    it "assigns auctions instance variables that includes auction" do 
      auction
      get :index
      expect(assigns(:auctions)).to include auction
    end
  end

  describe "#new" do 
    it "assigns a new auction instance variable" do 
      get :new
      expect(assigns(:auction)).to be_instance_of(Auction)
    end
  end

  describe "#create" do
    context "with valid params" do 
      def valid_request
        post :create, auction: {title: "some valid title", details: "some valid details"}
      end

      it "creates an auction record in the database" do 
        expect { valid_request}.to change { Auction.count }.by(1)
      end
      it "redirects to auction show page" do
        valid_request
        expect(response).to redirect_to(Auction.last)
      end
    end
    context "with invalid params" do 
      def invalid_request
        post :create, auction: { title: "", details: "valid details"}
      end

      it "doesn't craete a record in the database" do 
        expect { invalid_request }.to_not change { Auction.count }
      end
      it "renders new template" do 
        invalid_request
        expect(response).to render_template(:new)
      end  
    end    
  end
  describe "#edit" do 
    it "assigns an instance variable with auction whose id is passed" do 
      get :edit, id: auction.id 
      expect(assigns(:auction)).to eq(auction)
    end
  end
  describe "#show" do 
    it "assigns an instace variable with auction whose id is passed " do 
      get :show, id: auction.id
      expect(assigns(:auction)).to eq(auction)
    end
  end
  describe "#update" do 
    context "with valid params" do 
      def valid_request 
        patch :update, id: auction.id, auction: {title: "Some new title"}
      end

      it "changes title to the new passed title" do 
        valid_request
        auction.reload
        expect(auction.title).to eq("Some new title")
      end

      it "redirects to auction show page" do 
        valid_request
        expect((response)).to redirect_to(auction)
      end
    end
    context "with invalid params" do 
      def invalid_request 
        patch :update, id: auction.id, auction: {title: ""}
      end

      it "doesn''t change the title" do
        old_title = auction.title
        invalid_request
        auction.reload
        expect(auction.title).to eq(old_title)
      end
      it "renders edit template" do 
        invalid_request
        expect(response).to render_template(:edit)

      end
    end
  end

  describe "#destroy" do 
    it "removes the auction from the database" do 
      auction
      expect{ delete :destroy, id: auction.id }.to change { Auction.count }.by(-1)
    end
    it "redirects to auction listing page" do
      delete :destroy, id: auction.id
      expect(response).to redirect_to(auctions_path)
    end
  end
end







