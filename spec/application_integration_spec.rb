require 'spec_helper'

describe "GET '/' - Greeting Form" do
  it 'welcomes the user' do
    visit '/'
    expect(page.body).to include("Welcome!")
    #page object represents an instance of the page the user will be looking at in their browser
  end

  it "has a greeting form with a user_name field" do
    visit '/'

    expect(page).to have_selector("form")
    #will look for a form tag in the body of the html code
    expect(page).to have_field(:user_name)

  end

  describe "POST '/greet' - User Greeting" do
    it 'greets the user personally based on their user_name in the form' do
      visit '/'

      fill_in(:user_name, :with => "Avi")
      click_button "Submit"

      expect(page).to have_text("Hi Avi, nice to meet you!")
    end
  end
end
