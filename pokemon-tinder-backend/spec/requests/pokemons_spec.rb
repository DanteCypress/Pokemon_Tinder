require 'rails_helper'

describe "Pokemons API" do
  it "gets a list of Pokemons" do
    # Create a new pokemon in the Test Database (not the same one as development)
    Pokemon.create(name: 'Felix', age: 2, enjoys: 'Walks in the park')

    # Make a request to the API
    get '/pokemons'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to be_success

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end
    it "creates a pokemon" do
    # The params we are going to send with the request
    pokemon_params = {
      pokemon: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.'
      }
    }

    # Send the request to the server
    post '/pokemons', params: pokemon_params

    # Assure that we get a success back
    expect(response).to be_success

    # Look up the pokemon we expect to be created in the Database
    new_pokemon = Pokemon.first

    # Assure that the created pokemon has the correct attributes
    expect(new_pokemon.name).to eq('Buster')
  end
  it "doesn't create a pokemon without a name" do
    pokemon_params = {
      pokemon: {
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.'
      }
    }

    post '/pokemons', params: pokemon_params

    # This is a new test to make sure that our status is correct when the record can't be created
    # You can read more about HTTP response codes here: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
    expect(response.status).to eq 422

    # We also want to check that the API lets us know what is wrong, so the frontend can prompt the user to fix it.
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['name']).to include "can't be blank"
  end
end
