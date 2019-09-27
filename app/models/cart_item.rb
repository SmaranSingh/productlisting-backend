class CartItem < ApplicationRecord
  belongs_to :product

  def as_json(options = {})
    options.merge!({
      id: self.id,
      product_id: self.product_id,
      quantity: self.quantity,
      product: {
        id: product.id,
        name: product.name
      }
    })
  end
end
