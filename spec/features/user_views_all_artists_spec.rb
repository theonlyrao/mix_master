require 'rails_helper'

RSpec.feature "User submits mutiple artists" do
  scenario "they see all artists' names" do
    artist_one = Artist.create(name: "first", image_path: "url")
    artist_two = Artist.create(name: "second", image_path: "url")

    visit artists_path
    expect(page).to have_content artist_one.name
    expect(page).to have_content artist_two.name

    click_on "#{artist_two.name}"
    expect(current_path).to eq artist_path(artist_two.id)
  end
end
