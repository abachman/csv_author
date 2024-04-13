RSpec::Matchers.define :have_headers do |expected|
  match do |actual|
    actual.headers.map(&:name) == expected
  end

  failure_message do |actual|
    "expected #{actual.headers.map(&:name)} to equal #{expected}," \
      " got #{actual.headers.map(&:name)}"
  end
end

RSpec::Matchers.define :match_csv do |expected|
  match do |actual|
    raise "CsvAuthor::File record expected" unless actual.is_a?(CsvAuthor::File)

    actual.to_csv == expected
  end

  failure_message do |actual|
    "expected #{actual.to_csv.inspect} to equal #{expected}," \
  end
end
