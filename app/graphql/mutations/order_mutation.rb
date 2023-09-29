module Mutations
    class OrderMutation < Mutations::BaseMutation
      argument :quantity, Int, required: true
      argument :product_id, ID, required: true
      argument :user_id, ID, required: true
  
      field :order, Types::OrderType, null: true
      field :errors, [String], null: true
  
      def resolve(product_id:, quantity:, user_id:)
        user = User.find(1)
        product = Product.find_by(id: product_id)
        if product.nil?
            return { order: nil, errors: ["Product not found"] }
          end
          order = Order.new(product: product, quantity: quantity, user: user)
          if order.save
            { order: order, errors: [] }
          else
            { order: nil, errors: order.errors.full_messages }
          end
      end
    end
  end