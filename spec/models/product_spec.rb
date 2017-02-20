require 'rails_helper'

RSpec.describe Product, type: :model do

  # describe 'Validations' do
  #   it { is_expected.to validate_presence_of(:name) }
  #   it { is_expected.to validate_presence_of(:price) }
  #   it { is_expected.to validate_presence_of(:quantity) }
  #   it { is_expected.to validate_presence_of(:category) }
  # end
  # pending "add some examples to (or delete) #{__FILE__}"



  describe 'validations' do


    it "should create a new valid product" do
      @Category = Category.new({name: 'Apparel'})
      @product = Product.create(name: 'NY baseball cap', price_cents: 299, quantity: 2)
      @product.category = @Category
      expect(@product).to be_valid
    end

    it "product should have a valid name" do
      @product = Product.create()
      @product.name = nil
      @product.quantity = 22
      @product.price_cents = 8299
      @product.category = @Category

      expect(@product).to be_invalid
      expect(@product.errors[:name]).to include("can't be blank")
    end
    it "product should have a valid price" do
      @product = Product.create()
      @product.name = "NY Yanki baseball-cap"
      @product.quantity = 2
      @product.price_cents = nil
      @product.category = @Category

      expect(@product).to be_invalid
      expect(@product.errors[:price_cents]).to include("is not a number")

    end
    it "product should have a valid quantity" do
      @product = Product.create()
      @product.name = "Hipster glasses"
      @product.quantity = nil
      @product.price_cents = 8291
      @product.category = @Category

      expect(@product).to be_invalid
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it "produt should hava a valid category" do
      @product = Product.create()
      @product.name = "White-tshirts"
      @product.quantity = 59
      @product.price_cents = nil
      @product.category =nil

      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end


