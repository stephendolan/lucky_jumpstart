require "../spec_helper"

describe "Resend confirmation flow" do
  it "works for an unconfirmed user" do
    user = UserFactory.create &.confirmed_at(nil)
    flow = ResendEmailConfirmationFlow.new(user)

    flow.request_email_confirmation
    flow.should_have_sent_email_confirmation_email
  end

  it "works for a confirmed user" do
    user = UserFactory.create &.confirmed_at(Time.utc)
    flow = ResendEmailConfirmationFlow.new(user)

    flow.request_email_confirmation
    flow.should_have_sent_already_confirmed_email
  end
end
