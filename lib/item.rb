require "pry"

class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @open = true
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid if @open
  end

  def current_high_bid
    @bids.map { |attendee, bid| bid }.max
  end

  def close_bidding
    @open = false
  end
end
