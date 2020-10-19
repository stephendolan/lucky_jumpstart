class SignUpConfirmationRequests::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  route do
    RequestSignUpConfirmation.new(params).submit do |operation, user|
      if user
        flash.success = "You will receive another confirmation email shortly"

        if user.confirmed?
          SignUpAlreadyConfirmedEmail.new(user).deliver_later
        elsif user.unconfirmed?
          SignUpConfirmationEmail.new(user).deliver_later
        end
      else
        flash.failure = "The provided email address doesn't exist. Please sign up for an account!"
        redirect to: SignUps::New
      end

      redirect to: SignIns::New
    end
  end
end
