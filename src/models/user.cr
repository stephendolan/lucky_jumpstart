class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  include Users::EmailConfirmable

  table do
    column email : String
    column first_name : String?
    column last_name : String?
    column encrypted_password : String
  end

  def full_name : String?
    return nil unless first_name || last_name

    [first_name, last_name].compact.join(" ")
  end

  # Show Gravatar images by default for users.
  #
  # If there is another potential source, you can select among them in this method.
  def image(size : Number = 100) : String
    gravatar_base_url = "https://gravatar.com/avatar/"
    hash = Digest::MD5.hexdigest(email.downcase)
    params = "?s=#{size}&d=identicon"

    gravatar_base_url + hash + params
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
