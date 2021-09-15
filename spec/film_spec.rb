require 'rspec'
require './lib/film'

describe Film do
  it 'exists' do
    film = Film.new({
                      title: 'Aliens',
                      rating: 'R',
                      run_time: '2hr',
                      release_date: 'June 13, 1986'
                    })
    expect(film).to be_an_instance_of(Film)
  end

  it 'attributes' do
    info = {
              title: 'Aliens',
              rating: 'R',
              run_time: '2hr',
              release_date: 'June 13, 1986'
            }
    film = Film.new(info)

    expect(film.title).to eq('Aliens')
    expect(film.rating).to eq('R')
    expect(film.run_time).to eq('2hr')
    expect(film.release_year).to eq('1986')
  end

  it '#cast' do
    info = {
              title: 'Aliens',
              rating: 'R',
              run_time: '2hr',
              release_date: 'June 13, 1986'
            }
    film = Film.new(info)
    performer = Performer.new("Sally", 37)

    expect(film.cast).to eq([])
    
    film.hire(performer)

    expect(film.cast).to eq([performer])
  end
end