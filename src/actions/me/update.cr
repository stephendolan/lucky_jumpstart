class Me::Update < BrowserAction
  include Auth::RequireSignIn

  post "/me" do
    SaveUserSettings.update(current_user, params) do |operation, updated_user|
      if operation.saved?
        flash.success = "Your settings were saved"
        redirect Me::Edit
      else
        html Me::EditPage, operation: operation, user: updated_user
      end
    end
  end
end
