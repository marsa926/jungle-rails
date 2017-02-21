require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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
    puts "I'm running"
    visit root_path

    # click_on 'Details »'

    find_link("Details").trigger('click')



    expect(page).to have_css 'section.products-show'
    # save_screenshot
  end
end
