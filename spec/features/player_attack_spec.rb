
feature "attacking another player" do
  scenario "attacks a player" do
    sign_in_and_play
    click_button("Attack Player 2!")
    expect(page).to have_content("John fireballed Jim!")
  end

  scenario "attack reduces player 2's HP by 10" do
    sign_in_and_play
    click_button("Attack Player 2!")
    expect(page).not_to have_content 'Jim: 50HP'
    expect(page).to have_content 'Jim: 40HP'
  end

  scenario "mulptiple attacks reduces player's HP's" do
    sign_in_and_play
    click_button("Attack Player 2!")
    click_button("Attack Player 1!")
    click_button("Attack Player 2!")
    expect(page).not_to have_content 'Jim: 50HP'
    expect(page).to have_content 'Jim: 30HP'
  end
end

feature 'Game is over' do
  scenario 'you have attacked 5 times' do
    sign_in_and_play
    4.times do
      click_button("Attack Player 2!")
      click_button("Attack Player 1!")
    end
    click_button("Attack Player 2!")
    expect(page).to have_content 'GAME OVER'
  end
end
