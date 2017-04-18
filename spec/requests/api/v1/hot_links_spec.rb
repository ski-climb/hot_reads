require 'rails_helper'

describe "returning link urls 2 through 10 according to read count" do
  let!(:low_link) { Link.create(url: "http://www.cats.com", read_count: 22) }
  let!(:top_link) { Link.create(url: "http://www.ants.com", read_count: 4444) }
  before do
    9.times do |n|
      Link.create(url: "http://www.dogs_#{n}.com", read_count: 333)
    end
  end

  it "returns only the urls" do
    get "/api/v1/links/hot_links"

    link_urls = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(link_urls).not_to include(low_link.url)
    expect(link_urls).not_to include(top_link.url)
    expect(link_urls.length).to eq 9
  end
end
