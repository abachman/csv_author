module CsvAuthor
  class Column
    attr_accessor :name, :value

    def initialize(name, value)
      @name = name
      @value = value
    end
  end

  class Row
    def initialize(file = nil)
      @file = file
      @columns = []
    end

    def [](name)
      @columns.find { |column| column.name == name }&.value
    end

    def []=(name, value)
      column = @columns.find { |column| column.name == name }
      column.value = value if column
    end

    def values
      @columns.map(&:value)
    end

    def append(value)
      add_column(nil, value)
    end

    def add_column(name, value)
      @columns << Column.new(name, value)
    end

    def to_csv
      CSV.generate_line(@columns.map(&:value))
    end
  end
end
