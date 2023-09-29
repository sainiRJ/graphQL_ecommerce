module Mutations
    class SignupMutation < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true

    

  
      field :user, Types::UserType, null: true
      field :errors, [String], null: true
  
      def resolve(email:, password:, password_confirmation:)
        if password == password_confirmation
        user = User.new(email: email, password: password)
        if user.save
          { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
      end
    end
    end
  end