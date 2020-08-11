class Home::Index < BrowserAction
  include Auth::AllowGuests

  get "/" do
    if current_user?
      redirect Dashboard::Index
    else
      html Marketing::IndexPage
    end
  end
end
