require "rails_helper"

RSpec.feature "User edits a playlist" do
  scenario "they go to playlist a page" do
    playlist = create(:playlist)
    song_one, song_two, song_three = create_list(:song, 3)
    new_playlist_name = "wisconsin"

    PlaylistSong.create(playlist_id: playlist.id, song_id: song_one.id)
    PlaylistSong.create(playlist_id: playlist.id, song_id: song_three.id)

    visit playlist_path(playlist.id)
    click_on "Edit"
save_and_open_page
    fill_in "Name", with: new_playlist_name
    uncheck("song-#{song_three.id}")
    check("song-#{song_two.id}")
    click_on "Update Playlist"

    expect(page).to have_content new_playlist_name
    expect(page).to have_content song_two.title
    expect(page).not_to have_content song_three.title
  end
end
