module CsvAuthor
  class Header
    attr_reader :required, :namespace

    def initialize(name:, label:, required:, namespace:, namespace_separator: "_")
      @name = name
      @label = label
      @required = required
      @namespace = namespace
      @namespace_separator = namespace_separator
    end

    def name
      if @namespace.any?
        [*@namespace, @name]
          .map(&:to_s)
          .join(@namespace_separator)
          .to_sym
      else
        @name.to_sym
      end
    end

    def label
      @label || name.to_s
    end
  end
end
