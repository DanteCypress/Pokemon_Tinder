class PokemonsController < ApplicationController

  def index
    pokemons = Pokemon.all
    render json: pokemons
  end

  def create
    # Create a new Pokemon
    pokemon = Pokemon.create(pokemon_params)
    if pokemon.valid?
    render json: Pokemon.all
   else
     render json: pokemon.errors, status: :unprocessable_entity
   end
 end

   def destroy
   pokemon = Pokemon.destroy(params[:id])
    render json: Pokemon.all
  end


  # Handle strong parameters, so we are secure
  def pokemon_params
    params.require(:pokemon).permit(:name, :age, :enjoys)
  end
end
