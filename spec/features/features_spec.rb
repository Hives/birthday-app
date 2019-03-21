feature 'The form page' do
  # As a user
  # So that I can feel warm and fuzzy
  # It should give me a friendly welcome
  scenario "It should give me a warm welcome" do
    visit "/"
    expect(page).to have_content("Hello there!")
  end

end

feature 'The response page' do
  # As a user
  # So that I can appreciate the personal touch
  # It should address me by name
  scenario "It should address me by name" do
    visit "/"
    fill_in('name', with: "Paul")
    click_button('Go!')
    expect(page).to have_content("Paul")
  end
end

