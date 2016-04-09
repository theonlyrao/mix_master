require "rails_helper"

RSpec.feature "User edits a playlist" do
  scenario "they go to playlist a page" do
    playlist = create(:playlist)
    song_one, song_two, song_three = create_list(:song, 3)
    new_playlist_name = "wisconsin"

    PlaylistSong.create(playlist_id: playlist.id, song_id: song_one.id)
    PlaylistSong.create(playlist_id: playlist.id, song_id: song_two.id)

    visit playlist_path(playlist.id)
    click_on "Edit"

    fill_in "Name", with: new_playlist_name
    save_and_open_page
    # uncheck("song-#{song_two.id}")
    check("song-#{song_three.id}")
    click_on "Update Playlist"

    expect(page).to have_content new_playlist_name
    expect(page).to have_content song_three.title
    expect(page).not_to have_content song_two.title
  end
end
