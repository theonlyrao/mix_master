require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see page with update info on artist" do
    artist = Artist.create(name: "Ed", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    new_name = "Ward"

    visit artist_path(Artist.last.id)
    click_on "Edit this Artist"
    fill_in "artist_name", with: new_name
    click_on "Update Artist"

    expect(page).to have_content new_name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
