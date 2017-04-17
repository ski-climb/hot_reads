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

    it "returns the links by popularity according to read_counts" do
      expect(Link.by_read_count).to match_array([link_3, link_1, link_2])
    end
  end
end
