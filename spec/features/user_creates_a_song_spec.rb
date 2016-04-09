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

  scenario "they can't create without a title" do
    artist = create(:artist)

    visit artist_path(artist.id)
    click_on "New song"
    click_on "Create Song"

    expect(page).to have_content "Title can't be blank"
  end

  scenario "they can edit the song title" do
    artist = create(:artist)
    song = Song.create(title: "old", artist_id: "#{artist.id}")
    new_title = "new"

    visit song_path(song.id)
    click_on "Edit"

    expect(current_path).to eq edit_song_path(song.id)
    fill_in "song_title", with: new_title
    click_on "Update Song"

    expect(current_path).to eq song_path(song.id)
    expect(page).to have_content new_title
    expect(page).to have_link artist.name, href:artist_path(artist.id)
  end
end
