feature 'Testing infrastructure' do
  puts "Whut"
  scenario "The testing infrastructure should work" do
    visit "/"
    expect(page).to have_content("Up and running!")
  end
end
