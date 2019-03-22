require 'date'

feature 'The form page' do
  # As a user
  # So that I can feel warm and fuzzy
  # It want to see a friendly welcome
  scenario "should give me a warm welcome" do
    visit "/"
    expect(page).to have_content("Hello there!")
  end

  # As a user
  # So that I can find out how long it is till my birthday
  # I want to enter my birthday
  scenario "should ask for the month of my birthday" do
    visit "/"
    expect(page.find('select[name="month"]'))
  end

  scenario "should ask for the day of my birthday" do
    visit "/"
    expect(page.find('input[name="day"]'))
  end

end

feature 'The response page' do
  # As a user
  # So that I can feel the personal touch
  # It should make a sensible guess at my name if I don't enter one
  context "if I submit the form with no name" do
    it "should make a sensible guess at my name" do
      Capybara.current_session.driver.header('User-Agent', 'my user agent')
      complete_form("", 6, "December")
      expect(page.find_by_id('name').text).not_to eq ""
    end
  end

  # As a user
  # So that I can feel the vibes
  # I want to be wished happy birthday if it is my birthday
  context "if today is my birthday" do
    scenario "should wish me happy birthday" do
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
  context "my birthday is in five days" do
    before do
      birthday = Date.today + 5
      @day = birthday.day
      @month = birthday.strftime('%B')
    end

    scenario "should not wish me a happy birthday" do
      complete_form("Matt", @day, @month)
      expect(page).not_to have_content("Happy birthday Matt!")
    end

    scenario "should tell me how many days it is until my birthday" do
      complete_form("Sandra", @day, @month)
      expect(page).to have_content("Your birthday will be in 5 days, Sandra.")
    end
  end

  # As a grammar pedant
  # So I can avoid being offended
  # I don't want to see an 's' on the end of 'days' if there's only one
  context "my birthday is tomorrow" do
    before do
      birthday = Date.today + 1
      @day = birthday.day
      @month = birthday.strftime('%B')
    end

    scenario "should say '1 day' not '1 days'" do
      complete_form("Sarah", @day, @month)
      expect(page).to have_content("Your birthday will be in 1 day, Sarah.")
    end
  end
end

feature 'The error page' do
  # As a user
  # So that I don't see a scary Sinatra error page
  # I want to see a friendly error message if I enter an invalid date
  context "if I enter some text in the 'day' field" do
    it "should show me a friendly error message" do
      complete_form("Paul", "some_text", "March")
      expect(page).to have_content("Whoops!")
    end
  end

  context "if I enter a bad number in the 'day' field" do
    it "should show me a friendly error message" do
      complete_form("Paul", 99, "March")
      expect(page).to have_content("Whoops!")
    end
  end

  # As a user
  # So I don't end up lost without a clue
  # I want to be able to get back to the main page from the error page
  context "if I end up on the error page" do
    it "lets me return to the main page" do
      complete_form("Sarah", 666, "January")
      expect(page).to have_link(nil, href: '/')
    end
  end
end
