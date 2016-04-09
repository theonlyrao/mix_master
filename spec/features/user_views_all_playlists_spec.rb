require "rails_helper"

RSpec.feature "User views all playlists" do
  scenario "they view playlists index page" do
    playlist_one, playlist_two = create_list(:playlist, 2)

    visit playlists_path

    expect(page).to have_link playlist_one.name, href: playlist_path(playlist_one.id)
    expect(page).to have_link playlist_two.name, href: playlist_path(playlist_two.id)
  end
end
