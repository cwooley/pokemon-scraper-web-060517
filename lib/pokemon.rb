require 'pry'
class Pokemon
  attr_accessor :type, :db, :id, :name, :hp
  def initialize(name)
    @name = name
  end

  def self.save(name, type, db)
    db.execute( "INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", [name, type])
  end

  def self.find(id, db)
    pokemon_arr = db.execute( "SELECT * FROM pokemon WHERE id = ?", [id]).flatten
    pokemon = Pokemon.new(pokemon_arr[1])
    pokemon.id = pokemon_arr[0]
    pokemon.type = pokemon_arr[2]
    if pokemon_arr[3]
      pokemon.hp = pokemon_arr[3]
    end
    pokemon
  end

  def alter_hp(hp, db)
    un_sanitized = "UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id}"

    db.execute(un_sanitized)

  # p db.execute("SELECT * FROM pokemon")

  end





end
