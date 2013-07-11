require 'minitest/autorun'
require './bacon.rb'

describe "bacon.rb" do
  before do
    @actors = ActorList.new
    @films = FilmList.new

    @data = {
      "Kevin Bacon" => ["Mystic River (2003)"],
      "Sean Penn" => ["Mystic River (2003)", "21 Grams (2003)"],
      "Naomi Watts" => ["21 Grams (2003)", "King Kong (2005)"],
      "Jack Black" => ["King Kong (2005)", "Kung Fu Panda (2008)"],
      "Dustin Hoffman" => ["Kung Fu Panda (2008)", "Rain Man (1988)"],
      "Tom Cruise" => ["Rain Man (1988)", "Top Gun (1986)"],
      "Val Kilmer" => ["Top Gun (1986)", "Kiss Kiss Bang Bang (2005)"],
      "Robert Downey Jr." => ["Kiss Kiss Bang Bang (2005)", "Sherlock Holmes (2009)"],
      "Jude Law" => ["Sherlock Holmes (2009)"]
    }

    @data.each do |a, f|
      a = @actors.find(a)
      f.each do |b|
        a.add_film(@films.find(b))
      end
    end

    @kevin = @actors.find("Kevin Bacon")
    @sean = @actors.find("Sean Penn")
    @naomi = @actors.find("Naomi Watts")
    @jack = @actors.find("Jack Black")
    @dustin = @actors.find("Dustin Hoffman")
    @tom = @actors.find("Tom Cruise")
    @val = @actors.find("Val Kilmer")
    @robert = @actors.find("Robert Downey Jr.")
    @jude = @actors.find("Jude Law")

  end

  it "should find Kevin Bacon's bacon number" do
    @kevin.distance_from(@kevin).must_equal 0
  end

  it "should find Sean Penn's bacon number" do
    @sean.distance_from(@kevin).must_equal 1
  end

  it "should find Naomi Watts's bacon number" do
    @naomi.distance_from(@kevin).must_equal 2
  end

  it "should find Jack Black's bacon number" do
    @jack.distance_from(@kevin).must_equal 3
  end

  it "should find Dustin Hoffman's bacon number" do
    @dustin.distance_from(@kevin).must_equal 4
  end

  it "should find Tom Cruise's bacon number" do
    @tom.distance_from(@kevin).must_equal 5
  end

  it "should find Val Kilmer's bacon number" do
    @val.distance_from(@kevin).must_equal 6
  end

  it "should find Robert Downey Jr's bacon number" do
    @robert.distance_from(@kevin).must_equal 7
  end

  it "should find Jude Law's bacon number" do
    @jude.distance_from(@kevin).must_equal 8
  end
end
