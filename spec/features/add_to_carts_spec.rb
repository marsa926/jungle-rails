require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 99.99
      )
    end
  end

  scenario "Click the product and navigate to a detail page" do

    visit root_path

    # click_on 'Details »'

    click_link("Add")


    # within('nav') do
    #   expect(page).to have_content('My Cart (1)')
    # end

    within('nav') { expect(page).to have_content('My Cart (1)') }
    # save_screenshot
  end


end
