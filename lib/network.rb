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

    total_characters.filter do |char|
      char.salary > 500_000 && char.name == char.name.upcase
    end
  end

  def actors_by_show
    by_show = {}
    shows.each do |show|
      by_show[show] = show.actors.sort
    end
    by_show
  end

  def shows_by_actor
    by_actor = {}
    @shows.each do |show|
      show.actors.each do |actor|
        by_actor[actor].nil? ? by_actor[actor] = [show] : by_actor[actor] << show
      end
    end
    by_actor
  end

  def prolific_actors
    prolifics = []
    shows_by_actor.each do |actor, shows|
      prolifics << actor if shows.length > 1
    end
    prolifics
  end
end
