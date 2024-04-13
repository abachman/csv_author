require "spec_helper"

RSpec.describe CsvAuthor::FileBuilder do
  describe "#headers" do
    it "allows defining headers with list" do
      subject.headers :name, :age
      expect(subject.file).to have_headers(%i[name age])
    end

    it "allows defining headers in block" do
      subject.headers do
        column :name
        column :age
      end

      expect(subject.file).to have_headers(%i[name age])
    end

    it "allows nesting headers block" do
      expect {
        subject.headers do
          headers do
            column :name
          end
        end
      }.not_to raise_error
    end
  end

  describe "#column" do
    it "defines file headers" do
      subject.column :name
      expect(subject.file).to have_headers(%i[name])
    end
  end

  describe "#group" do
    it "defines grouped headers" do
      subject.group :account do
        column :name
        column :email
      end

      expect(subject.file).to have_headers(
        %i[account_name account_email]
      )
    end

    it "defines nested grouped headers" do
      subject.group :account do
        column :name
        group :contact do
          column :email
        end
      end

      expect(subject.file).to have_headers(
        %i[account_name account_contact_email]
      )
    end
  end
end
