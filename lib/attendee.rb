require "pry"

class Attendee
  attr_reader :name, :budget

  def initialize(name: this_name, budget: this_budget)
    @name = name
    @budget = budget[1..-1].to_i
  end
end
