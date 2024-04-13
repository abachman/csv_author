require "csv"
require_relative "csv_author/version"

module CsvAuthor
  autoload :File, "csv_author/file"
  autoload :FileBuilder, "csv_author/file_builder"
  autoload :Row, "csv_author/row"
  autoload :RowBuilder, "csv_author/row_builder"
  autoload :Header, "csv_author/header"

  class Error < StandardError; end

  def self.file(&)
    builder = FileBuilder.new(&)
    builder.file
  end
end
