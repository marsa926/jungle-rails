class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  after_create :change_quantity

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  private
    def change_quantity
      order_items = LineItem.where(order_id: id)
      order_items.each do |item|
        item.product.quantity -= item.quantity
        item.product.save!
      end
    end
end
