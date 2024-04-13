$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "csv_author"

class MyFile < CsvAuthor::File
  headers do
    column :name, "name", required: true
    column :age, "age", required: true
    column :birthday, "birthday"
  end
end

source = <<~CSV
  name,age,birthday
  John,25,
  Jane,22,
  Joe,30,
  Jack,,01/01/1990
CSV

file = MyFile.parse(source)

# reproduce input
puts file.to_csv
