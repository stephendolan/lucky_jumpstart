module Users::EmailConfirmable
  macro included
    column confirmed_at : Time?
    column confirmation_token : String
  end

  def confirmed?
    !confirmed_at.nil?
  end

  def unconfirmed?
    !confirmed?
  end
end
