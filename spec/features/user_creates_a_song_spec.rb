require "rails_helper"

RSpec.feature "User creates a new song" do
  scenario "they see the page to create a song" do
    artist = create(:artist)

    song_title = "Wonderful"

    visit artist_path(artist.id)
    click_on "New song"

    expect(current_path).to eq new_artist_song_path(artist.id)

    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(current_path).to eq song_path(Song.last.id)
    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href:artist_path(artist.id)
  end
end
