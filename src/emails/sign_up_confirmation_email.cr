class SignUpConfirmationEmail < BaseEmail
  def initialize(@user : User)
  end

  to @user
  subject "Confirm your email to get started on #{Application.settings.name}"
  templates html, text
end
