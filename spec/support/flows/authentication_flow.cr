class AuthenticationFlow < BaseFlow
  private getter email

  def initialize(@email : String)
  end

  def sign_up(password)
    visit SignUps::New
    fill_form SignUpUser,
      email: email,
      password: password,
      password_confirmation: password
    sign_up_button.click
  end

  def sign_out
    visit Me::Edit
    sign_out_button.click
  end

  def sign_in(password)
    visit SignIns::New
    fill_form SignInUser,
      email: email,
      password: password
    sign_in_button.click
  end

  def confirm_user
    user = UserQuery.new.email(email).first
    SaveUser.update!(user, confirmed_at: Time.utc)
  end

  def should_send_confirmation_email
    user = UserQuery.new.email(email).first
    SignUpConfirmationEmail.new(user).should be_delivered
  end

  def should_be_signed_in
    sign_out_button.should be_on_page
  end

  def should_be_on_sign_in_page
    el("body", text: "Sign in").should be_on_page
  end

  def should_have_password_error
    el("body", text: "Password is wrong").should be_on_page
  end

  def should_have_confirmation_error
    el("body", text: "Email is not confirmed").should be_on_page
  end

  private def sign_out_button
    el("@nav-sign-out-button")
  end

  private def sign_in_button
    el("@sign-in-button")
  end

  private def sign_up_button
    el("@sign-up-button")
  end
end
