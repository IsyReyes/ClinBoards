require_relative "checklist"

class Card
  attr_accessor :id, :title, :members, :labels, :due_date, :checklist

  def initialize(id, title, members = [], labels = [], due_date = nil, checklist = [])
    @id = id
    @title = title
    @members = members
    @labels = labels
    @due_date = due_date
    @checklist = checklist.is_a?(Array) ? checklist.map { |item| ChecklistItem.new(item[:title], item[:completed]) } : []
  end

  def to_json(*args)
    { 
      id: @id, 
      title: @title, 
      members: @members, 
      labels: @labels, 
      due_date: @due_date, 
      checklist: @checklist
    }.to_json(*args)
  end
end