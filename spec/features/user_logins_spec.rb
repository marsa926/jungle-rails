require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"

    # SETUP
  before :each do
    @user = User.create!(
      first_name: 'sara',
      last_name: 'han',
      email: 'marsa926@gmail.com',
      email_confirmation: 'marsa926@gmail.com',
      password: '0000',
      password_confirmation: '0000'
      )
    end


  scenario "user log-in works" do

    visit login_path


    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password

    click_on 'Submit'



    within('nav') { expect(page).to have_content('sara') }
    puts "worked"
    save_screenshot

  end
end
