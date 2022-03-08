require "rspec"
require "pry"
require "./lib/item.rb"
require "./lib/auction.rb"
require "./lib/attendee.rb"

describe 'Auction' do
  context 'Iteration 1' do
    before :each do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @attendee = Attendee.new({name: 'Megan', budget: '$50'})
      @auction = Auction.new
    end

    it 'Objects exist' do
      expect(@item1).to be_an_instance_of Item
      expect(@item2).to be_an_instance_of Item
      expect(@attendee).to be_an_instance_of Attendee
      expect(@auction).to be_an_instance_of Auction
    end

    it 'Item has attributes' do
      expect(@item1.name).to eq "Chalkware Piggy Bank"
      expect(@item2.name).to eq "Bamboo Picture Frame"
    end

    it 'Attendee has attributes' do
      expect(@attendee.name).to eq "Megan"
      expect(@attendee.budget).to eq 50
    end

    it 'Auction has attributes' do
      expect(@auction.items).to eq []
    end

    it 'Auction #add_item' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq [@item1, @item2]
    end

    it 'Auction #item_names' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expected = ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
      expect(@auction.item_names).to eq expected
    end
  end
end
