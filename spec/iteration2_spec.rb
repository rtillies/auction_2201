require "rspec"
require "pry"
require "./lib/item.rb"
require "./lib/auction.rb"
require "./lib/attendee.rb"

describe 'Iteration 2' do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')

    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')

    @auction = Auction.new
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
  end

  it 'Item #bids no bids' do
    expect(@item1.bids).to eq ({})
  end

  xit 'Item #add_bid' do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expected = {
      @attendee2 => 20,
      @attendee1 => 22
    }
    expect(@item1.bids).to eq expected
  end
end
