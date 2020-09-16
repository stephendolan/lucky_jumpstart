class Application
  Habitat.create do
    setting name : String
    setting support_email : String
  end
end

Application.configure do |settings|
  settings.name = "Lucky Jumpstart"
  settings.support_email = "no-reply@lucky_jumpstart.com"
end
