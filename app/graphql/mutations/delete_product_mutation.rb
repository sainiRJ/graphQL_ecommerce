# app/graphql/mutations/delete_user_mutation.rb
module Mutations
    class DeleteProductMutation < Mutations::BaseMutation
      argument :title, String, required: true

      field :success, Boolean, null: false
      field :errors, [String], null: true
  
      def resolve(title:)
        # user = context[:current_user]
        user = User.find(1)
        product = Product.find_by(title: title)
  
        if product.nil?
          return { success: false, errors: ['Authentication required'] }
        end
  
        if product.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: product.errors.full_messages }
        end
      end
    end
  end
  