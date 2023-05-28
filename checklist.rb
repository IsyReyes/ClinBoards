class ChecklistItem
  attr_accessor :title, :completed

  def initialize(title, completed)
    @title = title
    @completed = completed
  end

  def to_json(*args)
    { title: @title, completed: @completed }.to_json(*args)
  end
end