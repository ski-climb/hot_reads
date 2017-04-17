require 'rails_helper'

describe "Viewing list of links on home page" do
  context "links exist in the database" do
    let!(:link_1) { Link.create(url: "http://www.cats.com") }
    let!(:link_2) { Link.create(url: "http://www.dogs.com") }

    it "displays all link urls on the page" do
      visit root_path

      expect(page).to have_content link_1.url
      expect(page).to have_content link_2.url
    end
  end
end
