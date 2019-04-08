require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it "should validate name" do
    pokemon = Pokemon.create
    expect(pokemon.errors[:name]).to_not be_empty
  end
end
