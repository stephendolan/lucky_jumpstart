class SignUps::NewPage < AuthLayout
  needs operation : SignUpUser

  def page_title
    "Sign Up"
  end

  def content
    mount Shared::CenteredFormPanel, title: title_text do
      render_form(operation)
    end
  end

  private def render_form(op)
    form_for SignUps::Create do
      div class: "space-y-6" do
        mount Shared::Field, op.email, "Email", &.email_input(autofocus: "true", placeholder: "you@example.com")
        mount Shared::Field, op.password, "Password", &.password_input(placeholder: "*" * 12)
        mount Shared::Field, op.password_confirmation, "Confirm Password", &.password_input(placeholder: "*" * 12)
      end

      div class: "mt-6" do
        span class: "block w-full rounded-md shadow-sm" do
          submit "Sign up", class: "w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-primary-600 hover:bg-primary-500 cursor-pointer focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700 transition duration-150 ease-in-out", flow_id: "sign-up-button"
        end
      end

      div class: "mt-6 text-center" do
        div class: "text-sm leading-5" do
          link "Already have an account? Sign in!", to: SignIns::New, class: "font-medium text-primary-600 hover:text-primary-500 focus:outline-none focus:underline transition ease-in-out duration-150", flow_id: "sign-in-button"
        end
      end
    end
  end

  private def title_text
    "Create an account"
  end
end
