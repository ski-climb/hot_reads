require 'rails_helper'

describe "Viewing list of links on home page" do
  context "links exist in the database" do
    let!(:link_1) { Link.create(url: "http://www.cats.com", read_count: 22) }
    before do
      10.times do |n|
        Link.create(url: "http://www.dogs_#{n}.com", read_count: 333)
      end
    end

    it "displays up to ten link urls on the page" do
      visit root_path

      expect(page).to have_content "dogs_0.com"
      expect(page).to have_content "dogs_9.com"
      expect(page).not_to have_content link_1.url
    end
  end
end
