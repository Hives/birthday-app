feature 'Warm welcome' do
  scenario "It should give me a warm welcome" do
    visit "/"
    expect(page).to have_content("Hello there!")
  end
end
