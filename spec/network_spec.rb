require './lib/character'
require './lib/show'
require './lib/network'

RSpec.describe Network do
  context "Initialize" do
    it 'exists' do
      nbc = Network.new("NBC")
      expect(nbc).to be_a(Network)
    end

    it 'has a name' do
      nbc = Network.new("NBC")
      expect(nbc.name).to eq("NBC")
    end

    it 'starts with no shows' do
      nbc = Network.new("NBC")
      expect(nbc.shows).to eq([])
    end
  end

  context "Methods" do
    it 'can add shows' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

      nbc = Network.new("NBC")

      nbc.add_show(knight_rider)
      nbc.add_show(parks_and_rec)

      expect(nbc.shows).to eq([knight_rider, parks_and_rec])
    end

    it 'can return a list of main characters' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

      nbc = Network.new("NBC")

      nbc.add_show(knight_rider)
      nbc.add_show(parks_and_rec)

      expect(nbc.main_characters).to eq([kitt])
    end

    it 'can return a hash of actors by show' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

      nbc = Network.new("NBC")

      nbc.add_show(knight_rider)
      nbc.add_show(parks_and_rec)

      expect(nbc.actors_by_show).to eq({knight_rider => ["David Hasselhoff", "William Daniels"],
                                        parks_and_rec => ["Amy Poehler", "Nick Offerman"]})
    end

  end
end
