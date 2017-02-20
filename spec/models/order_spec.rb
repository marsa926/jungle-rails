require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @Category = Category.new({name: 'Apparel'})
      @product1 = Product.create!(name: 'Hipster glasses', quantity: 5, price_cents: 1000, category: @Category)
      @product2 = Product.create!(name: 'Bootiful dress', quantity: 10, price_cents: 5000, category: @Category)
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'marsa926@gmail.com',
        total_cents: 5000,
        stripe_charge_id: 'k1hso9d'
        )
      # 2. build line items on @order
      @order.line_items.new(
          product: @product2,
          quantity: 1,
          item_price: @product2.price_cents,
          total_price: @product2.price_cents * 1
        )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product2.quantity).to eql(9)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do

      # TODO: Implement based on hints in previous test
      @order = Order.new(
        email: 'marsa926@gmail.com',
        total_cents: 5000,
        stripe_charge_id: 'k1hso9d'
        )
      # 2. build line items on @order
      @order.line_items.new(
          product: @product2,
          quantity: 1,
          item_price: @product2.price_cents,
          total_price: @product2.price_cents * 1
        )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eql(5)
    end
  end
end
