require './lib/character'
require './lib/show'

class Network

  attr_reader :name, :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    total_characters = shows.flat_map do |show|
      show.characters
    end

    main_chars = total_characters.filter do |char|
      char.salary > 500_000 && char.name == char.name.upcase
    end
    main_chars
  end

  def actors_by_show
    by_show = {}
    shows.each do |show|
      by_show[show] = show.actors.sort
    end
    by_show
  end
end
