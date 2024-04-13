$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "csv_author"

MyFile = CsvAuthor.file do
  headers do
    group :account do
      column :name
      column :age
    end

    group :address do
      column :street
      column :city
    end
  end
end

file = MyFile.parse <<~CSV
  account_name,account_age,address_street,address_city
  John,25,123 Main St,Anytown
  Jane,22,456 Elm St,Anytown
  Joe,30,789 Oak St,Anytown
CSV

puts file.as_json
