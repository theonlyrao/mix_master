require "rails_helper"

RSpec.feature "User has created artist with multiple songs" do
  scenario "they see all songs listed alphabetically on artist page" do
    artist = create(:artist)
    song_one = create(:song, title: "charlie", artist_id: artist.id)
    song_two = create(:song, title: "alpha", artist_id: artist.id)
    song_three = create(:song, title: "bravo", artist_id: artist.id)

    visit artist_path(artist.id)

    expect(page).to have_selector("ul li:nth-child(1)", text: song_two.title)
    expect(page).to have_selector("ul li:nth-child(2)", text: song_three.title)
    expect(page).to have_selector("ul li:nth-child(3)", text: song_one.title)

    expect(page).to have_link("charlie", href: song_path(song_one.id))
    expect(page).to have_link("alpha", href: song_path(song_two.id))
    expect(page).to have_link("bravo", href: song_path(song_three.id))
  end
end
