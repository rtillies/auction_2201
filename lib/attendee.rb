require "pry"

class Attendee
  attr_reader :name, :budget

  def initialize(name:, budget:)
    @name = name
    @budget = budget[1..-1].to_i
  end
end
