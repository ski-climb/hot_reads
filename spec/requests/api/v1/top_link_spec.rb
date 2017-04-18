require 'rails_helper'

describe "returning the URL of the Top Link" do
  let!(:low_link) { Link.create(url: "http://www.cats.com", read_count: 22) }
  let!(:top_link) { Link.create(url: "http://www.dogs.com", read_count: 333) }

  it "returns only the url" do
    get "/api/v1/links/top_link"

    link = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(link.first).to eq top_link.url
  end
end

