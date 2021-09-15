class Film
  attr_reader :title,
              :rating,
              :run_time,
              :cast

  def initialize(info)
    @info = info
    @title = info[:title]
    @rating = info[:rating]
    @run_time = info[:run_time]
    @cast = []
  end

  def release_year
    @info[:release_date].split(" ").last
  end

  def hire(performer)
    @cast << performer
  end
end