require_relative('../db/sql_runner.rb')

class Star
  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save
    sql = "INSERT INTO stars
    (first_name, last_name)
    VALUES
    ($1, $2)
    RETURNING *"
    values = [@first_name, @last_name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update

  end

  def delete

  end

  def self.delete_all
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

end
