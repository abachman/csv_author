$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

# a DSL for generating CSV files
require "csv_author"

MyFile = CsvAuthor.file do
  headers do
    column :name
    column :age, required: true
    column :birthday
  end
end

file = MyFile.generate do
  # hash style
  row name: "John", age: 25

  # array style
  row "Jane", 22

  # block style
  row do
    name "Joe"
    age 30
  end

  # repetition
  3.times do |i|
    row do
      name "Person #{i}"
      age 20 + i
    end
  end

  # rejects row with missing required column
  begin
    row do
      name "Jack"
      birthday "01/01/1990"
    end
  rescue e
    puts e.message
  end
end

# produces output
puts file.to_csv
