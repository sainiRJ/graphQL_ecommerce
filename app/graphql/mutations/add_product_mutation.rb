module Mutations
    class AddProductMutation < Mutations::BaseMutation
      argument :title, String, required: true
      argument :price, Float, required: true
      argument :imageUrl, String, required: true
      argument :description, String, required: true

    

  
      field :product, Types::ProductType, null: true
      field :errors, [String], null: true
  
      def resolve(title:, price:, imageUrl:, description:)
        user = User.find(1)
        product = user.products.create(title: title, price: price, imageUrl: imageUrl, description: description)
        if product.save
          { product: product, errors: [] }
        else
          { product: nil, errors: product.errors.full_messages }
        end
      end
    end
  end