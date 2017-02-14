require "pry"
require "CSV"
require "sqlite3"

@db = SQLite3::Database.new('db/guests.db')
@db.execute("DROP TABLE IF EXISTS pokemon;")
# @sql_runner = SQLRunner.new(@db)
# @sql_runner.execute_schema_migration_sql




class Guest
  attr_accessor :year, :occupation, :show_date, :group, :name, :db

  def initialize(year:, occupation:, show_date:, group:, name:, db:)
    @year = year
    @occupation = occupation
    @show_date = show_date
    @group = group
    @name = name
    @db = db
  end

  def save
    # GET INTO TABLE
    string = "INSERT INTO guests (year, occupation, show_date, group_name, name) VALUES ('#{year}', '#{occupation}', '#{show_date}', '#{group}', '#{name}');"
    @db.execute(string)
    # binding.pry
  end

end

# CREATE TABLE guests(id INTEGER PRIMARY KEY, year TEXT, occupation TEXT, show_date TEXT, group_name TEXT, name TEXT)

CSV.foreach("daily_show_guests.csv") do |row|
  if row == CSV.foreach("daily_show_guests.csv").first
    # binding.pry
  else
    x = row.map{|str| str.gsub("'", "\'\'")}
    # binding.pry
    guest = Guest.new(year: x[0], occupation: x[1], show_date: x[2], group: x[3], name: x[4], db: @db)
    guest.save
  end
end
