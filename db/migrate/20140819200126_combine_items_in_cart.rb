class CombineItemsInCart < ActiveRecord::Migration
  def change
  end

  def up
    #replae multiple items for asinge product in a cart with asingle itoem
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          cart line.items.where(product_id: product_id).delete_all
          item = cart.line_items.build(product_id: product_id)
          item.quanity = quantity
          item.save!
        end
      end
    end
  end
  def down
    #Split items with a quantity>1 into muliple items
    LineItem.where("quantity>1").each do |line_item|
      #add individual items
      line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id, product_id: line_item.product_id, quantity: 1
      end
      line_item.destroy
    end
  end
end
