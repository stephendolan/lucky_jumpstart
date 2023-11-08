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
    current_page.should have_element("@nav-sign-out-button")
  end

  def should_be_on_sign_in_page
    current_page.should have_element("body", text: "Sign in")
  end

  def should_have_password_error
    current_page.should have_element("body", text: "Password is wrong")
  end

  def should_have_confirmation_error
    current_page.should have_element("body", text: "Email is not confirmed")
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

  # NOTE: this is a shim for readability
  private def current_page
    self
  end
end
