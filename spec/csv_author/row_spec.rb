require "spec_helper"

RSpec.describe CsvAuthor::Row do
  describe "#row" do
    it "builds row with list" do
      subject.add_column :name, "John"
      subject.add_column :age, 30

      expect(subject.to_csv).to eq("John,30\n")
    end
  end
end
