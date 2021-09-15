# has title & location
# list films
# list films alphabetically
# hash performer keys and array of films as value
# newest release (film.release_year)

class Theater
  attr_reader :title,
              :location

  def initialize(title, location)
    @title = title
    @location = location
    @films = []
  end

  def add_film(film)
    @films << film
  end

  def films
    @films.sort_by do |film|
      film.title
    end
  end

  def performers_movies
    films_by_performer = {}
    films.each do |film|
      film.cast.each do |member|
        if films_by_performer[member]
          films_by_performer[member] << film
        else
         films_by_performer[member] = [film]
        end
      end
    end 
    films_by_performer
  end

  def newest_release
    films.max_by do |film|
      film.release_year
    end
  end
end