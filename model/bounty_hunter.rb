require("pg")

class Bounty
  attr_accessor :name, :species, :bounty_value, :last_known_location
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @species = options["species"]
    @bounty_value = options["bounty_value"]
    @last_known_location = options["last_known_location"]
  end

  def save()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
      })

    sql = "INSERT INTO bounties
          (
            name,
            species,
            bounty_value,
            last_known_location
          )
          VALUES
          (
            $1, $2, $3, $4
          )
          RETURNING *
          "

    values = [@name, @species, @bounty_value, @last_known_location]

    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i()
    db.close()
  end

  def self.all()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
      })

    sql = "SELECT * FROM bounties"

    values = []

    db.prepare("all", sql)
    bounties = db.exec_prepared("all", values)
    db.close()

    bounties_as_objects = bounties.map{ |bounty| Bounty.new(bounty)}
    return bounties_as_objects
  end

  def self.delete_all()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
      })

    sql = "DELETE FROM bounties"

    values = []

    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all", values)
    db.close()
  end

  def delete()
    db = PG.connect({
      dbname: "bounty_hunter",
      host: "localhost"
      })

    sql = "DELETE FROM bounties WHERE id = $1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end


end
