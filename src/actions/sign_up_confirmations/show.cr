class SignUpConfirmations::Show < BrowserAction
  include Auth::AllowGuests

  get "/confirm/:token" do
    user = UserQuery.new.confirmation_token(token).first?
    flash.keep

    if user && user.confirmed?
      flash.info = "You've already confirmed your email! Please sign in."
      redirect to: SignIns::New
    elsif user && user.unconfirmed?
      ConfirmSignUp.create(user, confirmed_at: Time.utc) do |_operation, new_user|
        if new_user
          flash.success = "Your email has been confirmed"
          redirect to: SignIns::New
        else
          flash.failure = "Unable to confirm your email, please try again."
          redirect to: Home::Index
        end
      end
    else
      flash.failure = "Unable to confirm your email, please try again."
      redirect to: SignIns::New
    end
  end
end
