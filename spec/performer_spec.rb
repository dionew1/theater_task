require 'rspec'
require './lib/performer'

describe Performer do
  it 'exists' do
    performer = Performer.new("Sally", 37)
    expect(performer).to be_an_instance_of(Performer)
  end

  it 'attributes' do
    performer = Performer.new("Sally", 37)
    expect(performer.name).to eq("Sally")
    expect(performer.age).to eq(37)
  end
end