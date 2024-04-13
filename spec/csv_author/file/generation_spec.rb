require "spec_helper"

RSpec.describe CsvAuthor::File do
  before do
    subject.configure do
      headers(:name, :age)
    end
  end

  describe "#generate" do
    it "builds csv output" do
      subject.generate do
        row "John", 30
      end

      expect(subject).to match_csv("John,30\n")
    end
  end
end
