require 'date'

feature 'The form page' do
  # As a user
  # So that I can feel warm and fuzzy
  # It want to see a friendly welcome
  scenario "It should give me a warm welcome" do
    visit "/"
    expect(page).to have_content("Hello there!")
  end

  # As a user
  # So that I can find out how long it is till my birthday
  # I want to enter my birthday
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
  # So that I don't see a scary Sinatra error page
  # I want to see a friendly error message if I enter an invalid date
  context "If I enter some text in the 'day' field" do
    it "should show me a friendly error message" do
      complete_form("Paul", "some_text", "March")
      expect(page).to have_content("Whoops!")
    end
  end

  context "If I enter a bad number in the 'day' field" do
    it "should show me a friendly error message" do
      complete_form("Paul", 99, "March")
      expect(page).to have_content("Whoops!")
    end
  end

  # As a user
  # So that I can feel the vibes
  # I want to be wished happy birthday if it is my birthday
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
  # I want to know how many days it is to my birthday
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
  # I don't want to see an 's' on the end of 'days' if there's only one
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
