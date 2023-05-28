require_relative "card"

class List
  attr_accessor :id, :name, :cards

  def initialize(id, name, cards = [])
    @id = id
    @name = name
    @cards = cards.is_a?(Array) ? cards.map { |card| Card.new(card[:id], card[:title], card[:members], card[:labels], card[:due_date], card[:checklist]) } : []
  end

  def to_json(*args)
    { 
      id: @id, 
      name: @name, 
      cards: @cards 
    }.to_json(*args)
  end
end