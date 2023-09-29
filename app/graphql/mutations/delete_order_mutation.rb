# app/graphql/mutations/delete_user_mutation.rb
module Mutations
    class DeleteOrderMutation < Mutations::BaseMutation
      argument :id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [String], null: true
  
      def resolve(id:)
        # user = context[:current_user]
        user = User.find(1)
        order = Order.find_by(id: id)
  
        if order.nil?
          return { success: false, errors: ['Authentication required'] }
        end
  
        if order.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: order.errors.full_messages }
        end
      end
    end
  end
  