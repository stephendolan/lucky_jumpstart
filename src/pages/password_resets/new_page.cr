class PasswordResets::NewPage < AuthLayout
  needs operation : ResetPassword
  needs user_id : UUID

  def page_title
    "Reset Your Password"
  end

  def content
    mount Shared::CenteredFormPanel, title: title_text do
      render_form(operation)
    end
  end

  private def render_form(op)
    form_for PasswordResets::Create.with(user_id) do
      div class: "space-y-6" do
        mount Shared::Field, op.password, "Password", &.password_input(autofocus: "true")
        mount Shared::Field, op.password_confirmation, "Confirm Password", &.password_input
      end

      div class: "mt-6" do
        span class: "block w-full rounded-md shadow-sm" do
          submit "Update password", class: "w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-primary-600 hover:bg-primary-500 cursor-pointer focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700 transition duration-150 ease-in-out", flow_id: "update-password-button"
        end
      end
    end
  end

  private def title_text
    "Reset your password"
  end
end
