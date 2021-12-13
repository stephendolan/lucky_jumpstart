require "../spec_helper"

describe "Authentication flow", tags: "flow" do
  it "works" do
    flow = AuthenticationFlow.new("test@example.com")

    flow.sign_up "password"
    flow.should_be_on_sign_in_page
    flow.should_send_confirmation_email
    flow.sign_in "password"
    flow.should_have_confirmation_error
    flow.confirm_user
    flow.sign_in "wrong-password"
    flow.should_have_password_error
    flow.sign_in "password"
    flow.should_be_signed_in
  end

  # This is to show you how to sign in as a user during tests.
  # Use the `visit` method's `as` option in your tests to sign in as that user.
  #
  # Feel free to delete this once you have other tests using the 'as' option.
  it "allows sign in through backdoor when testing" do
    user = UserFactory.create
    flow = BaseFlow.new

    flow.visit Me::Edit, as: user
    should_be_signed_in(flow)
  end
end

private def should_be_signed_in(flow)
  flow.el("@nav-sign-out-button").should be_on_page
end
