require 'set'

class Actor
  attr_accessor :name, :films

  def initialize(name)
    @name = name
  end

  def films
    @films ||= Set.new
  end

  def add_film(film)
    films << film
    film.add_actor(self)
    film
  end

  def distance_from(actor, depth = 0, found = {})
    if self == actor
      return depth
    end

    if !found.has_key? self
      found[self] = depth

      neighbours.each do |neighbour|
        if neighbour != self
          ret = neighbour.distance_from(actor, depth + 1, found)
          return ret if !ret.nil?
        end
      end
    end
  end

  def neighbours
    @neighbours ||= Set.new(films.map {|f| f.actors.to_a }.flatten.uniq)
  end
end

class Film
  attr_accessor :title, :actors

  def initialize(title)
    @title = title
  end

  def actors
    @actors ||= Set.new
  end

  def add_actor(actor)
    actors << actor
    actor
  end
end

class ActorList
  def actors
    @actors ||= Set.new
  end

  def add_actor(actor)
    self.actors << actor
    actor
  end

  def find(name)
    actors.find {|a| a.name == name } || add_actor(Actor.new(name))
  end
end

class FilmList
  def films
    @films ||= Set.new
  end

  def add_film(film)
    self.films << film
    film
  end

  def find(title)
    films.find {|f| f.title == title } || add_film(Film.new(title))
  end
end
