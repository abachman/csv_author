module CsvAuthor
  class File
    attr_reader :headers, :rows

    def initialize
      @headers = []
      @rows = []
    end

    def configure(&)
      FileBuilder.new(self, &)
    end

    def add_header(header)
      @headers << header
    end

    # generation
    def generate(&)
      RowBuilder.new(self, &)
    end

    def add_row(row)
      @rows << row
    end

    def to_csv
      CSV.generate(headers: @headers.map(&:name)) do |csv|
        @rows.each do |row|
          csv << row.values
        end
      end
    end
  end
end
