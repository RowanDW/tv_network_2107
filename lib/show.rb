class Show
  attr_reader :name, :creator, :characters
  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    characters.sum do |char|
      char.salary
    end
  end

  def highest_paid_actor
    sorted = characters.sort_by do |char|
      char.salary
    end.reverse
    sorted.first.actor
  end

  def actors
    characters.map do |char|
      char.actor
    end
  end
end
