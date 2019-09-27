class Product < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    has_one :cart_item

    def as_json(options = {})
        options.merge!({
          id: self.id,
          name: self.name,
          description: self.description,
          category: self.category,
          sub_category: self.sub_category,
          cart_item: cart_item
        })
      end
end