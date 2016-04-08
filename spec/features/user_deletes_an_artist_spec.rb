require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they see the page for the artist" do
    artist = Artist.create(name: "Ed", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(Artist.last.id)
    click_on "Delete"

    expect(current_path).to eq artists_path
    expect(page).not_to have_content "#{artist.name}"
  end
end
