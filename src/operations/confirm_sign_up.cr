class ConfirmSignUp < User::SaveOperation
  param_key :user

  permit_columns confirmed_at
end
