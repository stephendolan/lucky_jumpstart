class UserFactory < Avram::Factory
  def initialize
    email "#{sequence("test-email")}@example.com"
    encrypted_password Authentic.generate_encrypted_password("password")
    confirmation_token "#{Random::Secure.urlsafe_base64(32)}"
    confirmed_at Time.utc
  end
end
