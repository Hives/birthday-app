require 'date'

feature 'The form page' do
  # As a user
  # So that I can feel warm and fuzzy
  # It should give me a friendly welcome
  scenario "It should give me a warm welcome" do
    visit "/"
    expect(page).to have_content("Hello there!")
  end

  # As a user
  # So that I can find out how long it is till my birthday
  # I want to give it my birthday
  scenario "It should ask for the month of my birthday" do
    visit "/"
    expect(page.find('select[name="month"]'))
  end

  scenario "It should ask for the day of my birthday" do
    visit "/"
    expect(page.find('input[name="day"]'))
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

  # As a user
  # So that I can feel the vibes
  # It should wish me happy birthday if it's my birthday
  context "If today is my birthday" do
    before do
      today = Date.today
      @day = today.day
      @month = today.strftime('%B')
    end
    scenario "It should wish me happy birthday" do
      complete_form("Paul", @day, @month)
      expect(page).to have_content("Happy birthday Paul!")
    end
  end

  # As a user
  # So that I can feel the an-tici--------pation
  # It should tell me how many days it is to my birthday
  context "If tomorrow is my birthday" do
    before do
      tomorrow = Date.today + 1
      @day = tomorrow.day
      @month = tomorrow.strftime('%B')
    end
    xscenario "It should not wish me a happy birthday" do
      complete_form("Matt", @day, @month)
      expect(page).not_to have_content("Happy birthday Matt!")
    end
  end
end

