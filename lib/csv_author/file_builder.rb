module CsvAuthor
  class FileBuilder
    attr_reader :file

    def initialize(file = nil, &)
      @file = file || File.new
      @group_scope = []

      instance_eval(&) if block_given?
    end

    # defining headers with list or block
    def headers(*names, &)
      if names.any?
        names.each do |name|
          column(name)
        end
      elsif block_given?
        instance_eval(&)
      else
        raise ArgumentError, "must provide header names or use block syntax"
      end
    end

    def column(name, label: nil, required: false)
      @file.add_header Header.new(name:, label:, required:, namespace: @group_scope.dup)
    end

    # nesting syntax
    def group(name, &)
      @group_scope << name
      instance_eval(&)
      @group_scope.pop
    end
  end
end
