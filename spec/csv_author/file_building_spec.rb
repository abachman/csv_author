require "spec_helper"

RSpec.describe CsvAuthor do
  describe ".file" do
    it "builds a file" do
      file = described_class.file do
        # file with nothing
      end

      expect(file).to be_a(CsvAuthor::File)
    end

    it "allows defining headers with list" do
      file = CsvAuthor.file do
        headers :name, :age
      end

      expect(file).to have_headers(%i[name age])
    end

    it "allows defining headers in block" do
      file = CsvAuthor.file do
        headers do
          column :name
          column :age
        end
      end

      expect(file).to have_headers(%i[name age])
    end

    it "defines grouped headers" do
      file = CsvAuthor.file do
        headers do
          group :account do
            column :name
            column :email
          end

          group :address do
            column :street
            column :city
          end
        end
      end

      expect(file).to have_headers(
        %i[account_name account_email address_street address_city]
      )
    end
  end
end
