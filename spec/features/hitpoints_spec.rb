
feature "displays hit points" do
  scenario "See player 2's hit points" do
    sign_in_and_play
    expect(page).to have_content("John: 50HP")
  end
  scenario "See player 1's hit points" do
    sign_in_and_play
    expect(page).to have_content("Jim: 50HP")
  end
end
