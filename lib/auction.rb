require "pry"

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    @items.select {|item| item.bids.count == 0}
  end

  def potential_revenue
    @items.sum {|item| item.current_high_bid.to_i}
  end

  def bidders
    @items.flat_map do |item|
      item.bids.map { |bid, amount| bid.name }
    end.uniq
  end

  def bidder_info
    info = Hash.new
    @items.each do |item|
      item.bids.each do |attendee, bid|
        if !info.include?(attendee)
          info[attendee] = Hash.new
          info[attendee][:budget] = attendee.budget
          info[attendee][:items] = []
        end
        info[attendee][:items] << item
      end
    end
    info
  end
end
