class SignUpAlreadyConfirmedEmail < BaseEmail
  def initialize(@user : User)
  end

  to @user
  subject "Your #{Application.settings.name} email is already confirmed"
  templates html, text
end
