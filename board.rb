require "json"
require_relative "list"

class Board
  attr_accessor :id, :name, :description, :lists

  def initialize(id, name, description, lists = [])
    @id = id || @@id_count.next
    @@id_count += 1 if id.nil?
    @name = name
    @description = description
    @lists = lists.map do |list|
      List.new(list[:id], list[:name], list[:cards])
    end
  end
end

def format
[@id, @name, @description, @lists]
end

def to_json(*args)
  { id: @id, name: @name, description: @description, lists: @lists, cards: @cards }.to_json(*args)
end

def update (name:, description:)
  @name = name unless name.empty?
  @description = description unless description.empty?
end
