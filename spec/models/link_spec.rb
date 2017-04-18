require 'rails_helper'

describe Link do
  context "validations" do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to have_db_column(:url) }
    it { is_expected.to validate_uniqueness_of(:url).case_insensitive }
    it { is_expected.to have_db_column(:read_count) }
  end

  describe ".by_read_count" do
    let!(:link_1) { Link.create(url: "http://www.cats.com", read_count: 22) }
    let!(:link_2) { Link.create(url: "http://www.dogs.com", read_count: 11) }
    let!(:link_3) { Link.create(url: "http://www.anteaters.com", read_count: 33) }

    it "returns the links by popularity according to read_count" do
      expect(Link.by_read_count.first.id).to eq link_3.id
      expect(Link.by_read_count.last.id).to eq link_2.id
    end
  end

  describe ".top_link_url" do
    let!(:link_1) { Link.create(url: "http://www.cats.com", read_count: 22) }
    let!(:link_2) { Link.create(url: "http://www.dogs.com", read_count: 11) }
    let!(:link_3) { Link.create(url: "http://www.anteaters.com", read_count: 33) }

    it "returns the url of the link with the highest read_count" do
      expect(Link.top_link_url.first).to eq link_3.url
    end
  end
end
