class SignUpUser < User::SaveOperation
  param_key :user
  # Change password validations in src/operations/mixins/password_validations.cr
  include PasswordValidations

  permit_columns email
  attribute password : String
  attribute password_confirmation : String

  before_save do
    validate_uniqueness_of email
    assign_confirmation_token
    Authentic.copy_and_encrypt password, to: encrypted_password
  end

  after_commit send_confirmation_email

  private def assign_confirmation_token
    confirmation_token.value = Random::Secure.urlsafe_base64(32)
  end

  private def send_confirmation_email(user)
    SignUpConfirmationEmail.new(user).deliver_later
  end
end
