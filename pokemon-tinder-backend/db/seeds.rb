pokemon_attributes = [
  {
    name: 'WarTurtle',
    age: 2,
    enjoys: 'Surfing'
  },
  {
    name: 'Venasaur',
    age: 12,
    enjoys: 'Food mostly, really just food.'
  }
]

pokemon_attributes.each do |attributes|
  Pokemon.create(attributes)
end
