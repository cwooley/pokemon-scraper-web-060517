require 'pry'
class Pokemon
  attr_accessor :type, :db, :id, :name
  def initialize(name)
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute( "INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", [name, type])
  end

  def self.find(id, db)
    pokemon_arr = db.execute( "SELECT * FROM pokemon WHERE id = ?", [id]).flatten
    pokemon = Pokemon.new(pokemon_arr[1])
    pokemon.id = pokemon_arr[0]
    pokemon.type = pokemon_arr[2]
    pokemon
  end
end
