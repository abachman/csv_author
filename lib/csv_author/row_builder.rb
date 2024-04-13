module CsvAuthor
  class RowBuilder
    attr_reader :file

    def initialize(file, &block)
      @row = Row.new(file:)
      @file = file
      @file.add_row @row
    end

    def row(*values, &)
      if values.any?
        values.each do |value|
          @row.append value
        end
      elsif block_given?
        instance_eval(&)
      end
    end
  end
end
