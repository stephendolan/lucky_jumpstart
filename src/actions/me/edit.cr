class Me::Edit < BrowserAction
  get "/me" do
    html Me::EditPage,
      operation: SaveUserSettings.new(current_user),
      user: current_user
  end
end
