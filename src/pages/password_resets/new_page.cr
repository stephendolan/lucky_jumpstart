class PasswordResets::NewPage < AuthLayout
  needs operation : ResetPassword
  needs user_id : Int64

  def page_title
    "Reset Your Password"
  end

  def content
    m Shared::CenteredFormPanel, title: title_text do
      render_form(operation)
    end
  end

  private def render_form(op)
    form_for PasswordResets::Create.with(user_id) do
      div class: "space-y-6" do
        m Shared::Field, op.password, "Password", &.password_input(autofocus: "true")
        m Shared::Field, op.password_confirmation, "Confirm Password", &.password_input
      end

      div class: "mt-6" do
        span class: "block w-full rounded-md shadow-sm" do
          submit "Update password", class: "w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 cursor-pointer focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out", flow_id: "update-password-button"
        end
      end
    end
  end

  private def title_text
    "Reset your password"
  end
end
