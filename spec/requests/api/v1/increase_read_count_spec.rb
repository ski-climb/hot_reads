require 'rails_helper'

describe "Increasing read count via POST from URL Lockbox" do
  context "the link does not yet exist" do
    it "creates the link and sets read_count to one" do
      url = "http://www.cats.com"

      post "/api/v1/links", params: {
        link: {
          url: url
        }
      }

      expect(response.status).to eq 200
      expect(Link.first.url).to eq url
      expect(Link.first.read_count).to eq 1
    end
  end

  context "the link does exist" do
    let!(:existing_link) { Link.create(url: "http://www.dogs.com", read_count: 33) }

    it "increases the read_count by one" do
      post "/api/v1/links", params: {
        link: {
          url: existing_link.url
        }
      }

      expect(response.status).to eq 200
      expect(Link.find_by(url: existing_link.url).read_count).to eq 34
    end
  end
end
