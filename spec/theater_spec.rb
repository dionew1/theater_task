require 'rspec'
require './lib/theater'

describe Theater do
  it 'exists' do
    theater = Theater.new('AMC 1', "Denver, CO")
    expect(theater).to be_an_instance_of(Theater)
  end

  it 'attributes' do
    theater = Theater.new('AMC 1', "Denver, CO")
    expect(theater.title).to eq('AMC 1')
    expect(theater.location).to eq('Denver, CO')
  end

  it '#films' do
    info = {
              title: 'Aliens',
              rating: 'R',
              run_time: '2hr',
              release_date: 'June 13, 1986'
            }

    info_2 = {
              title: 'Zoolander',
              rating: 'R',
              run_time: '2hr',
              release_date: 'June 13, 1998'
            } 

    film = Film.new(info)
    film_2 = Film.new(info_2)
    theater = Theater.new('AMC 1', "Denver, CO")

    expect(theater.films).to eq([])

    theater.add_film(film_2)
    theater.add_film(film)

    expect(theater.films).to eq([film, film_2])
  end

  it '#performers_movies' do 
    info = {
              title: 'Aliens',
              rating: 'R',
              run_time: '2hr',
              release_date: 'June 13, 1986'
            }

    info_2 = {
              title: 'Zoolander',
              rating: 'R',
              run_time: '2hr',
              release_date: 'June 13, 1998'
            } 
    
    performer = Performer.new("Sally", 37)
    performer_2 = Performer.new("Georege", 45)
    performer_3 = Performer.new("Dani", 41)
    performer_4 = Performer.new("Dee", 79)

    film = Film.new(info)
    film_2 = Film.new(info_2)
    theater = Theater.new('AMC 1', "Denver, CO")

    film.hire(performer)
    film.hire(performer_2)
    film_2.hire(performer_2)
    film_2.hire(performer_3)
    film_2.hire(performer_4)

    theater.add_film(film_2)
    theater.add_film(film)

    expected = {
                  performer => [film],
                  performer_2 => [film, film_2],
                  performer_3 => [film_2],
                  performer_4 => [film_2]
                }

    expect(theater.performers_movies).to eq(expected)
  end

  it '#newest_release' do
    info = {
              title: 'Aliens',
              rating: 'R',
              run_time: '2hr',
              release_date: 'June 13, 1986'
            }

    info_2 = {
              title: 'Zoolander',
              rating: 'R',
              run_time: '2hr',
              release_date: 'June 13, 1998'
             }
    
    info_3 = {
              title: 'Gone with the Wind',
              rating: 'PG',
              run_time: '5hr',
              release_date: 'May13, 1977'
            } 

    film = Film.new(info)
    film_2 = Film.new(info_2)
    film_3 = Film.new(info_3)
    theater = Theater.new('AMC 1', "Denver, CO")

    theater.add_film(film)
    theater.add_film(film_2)
    theater.add_film(film_3)

    expect(theater.newest_release).to eq(film_2)
  end
end