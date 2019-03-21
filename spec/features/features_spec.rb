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
  # So that I can feel the vibes
  # It should wish me happy birthday if it's my birthday
  context "If today is my birthday" do
    scenario "It should wish me happy birthday" do
      birthday = Date.today
      day = birthday.day
      month = birthday.strftime('%B')
      complete_form("Paul", day, month)
      expect(page).to have_content("Happy birthday Paul!")
    end
  end

  # As a user
  # So that I can feel the an-tici--------pation
  # It should tell me how many days it is to my birthday
  context "If my birthday is in five days" do
    before do
      birthday = Date.today + 5
      @day = birthday.day
      @month = birthday.strftime('%B')
    end

    scenario "It should not wish me a happy birthday" do
      complete_form("Matt", @day, @month)
      expect(page).not_to have_content("Happy birthday Matt!")
    end

    scenario "It should tell me how many days it is until my birthday" do
      complete_form("Sandra", @day, @month)
      expect(page).to have_content("Your birthday will be in 5 days, Sandra.")
    end
  end

  # As a grammar pedant
  # So I can avoid being offended
  # I don't want to see an 's' on the end of 'days' unless necessary
  context "If my birthday is tomorrow" do
    before do
      birthday = Date.today + 1
      @day = birthday.day
      @month = birthday.strftime('%B')
    end
    scenario "It should say '1 day' not '1 days'" do
      complete_form("Sarah", @day, @month)
      expect(page).to have_content("Your birthday will be in 1 day, Sarah.")
    end
  end
end

