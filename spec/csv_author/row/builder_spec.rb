require "spec_helper"

RSpec.describe CsvAuthor::RowBuilder do
  subject {
    described_class.new(CsvAuthor.file {
      headers :name, :age
    })
  }

  describe "#row" do
    it "builds row with list" do
      subject.row "John", 30
      expect(subject.file).to match_csv("John,30\n")
    end
  end
end
