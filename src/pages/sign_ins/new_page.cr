class SignIns::NewPage < AuthLayout
  needs operation : SignInUser

  def page_title
    "Sign In"
  end

  def content
    m Shared::CenteredFormPanel, title: title_text do
      render_form(operation)
    end
  end

  private def render_form(op)
    form_for SignIns::Create do
      div class: "space-y-6" do
        m Shared::Field, op.email, "Email", &.email_input(autofocus: "true", placeholder: "you@example.com")
        m Shared::Field, op.password, "Password", &.password_input(placeholder: "*" * 12)
      end

      div class: "mt-6" do
        span class: "block w-full rounded-md shadow-sm" do
          submit "Sign in", class: "w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 cursor-pointer focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out", flow_id: "sign-in-button"
        end
      end

      div class: "mt-6 flex flex-col sm:flex-row space-y-2 sm:space-y-0 items-center justify-between" do
        div class: "text-sm leading-5" do
          link "Sign up", to: SignUps::New, class: link_class
        end

        div class: "text-sm leading-5" do
          link "Forgot your password?", to: PasswordResetRequests::New, class: link_class
        end
      end
    end
  end

  private def link_class
    "font-medium text-indigo-600 hover:text-indigo-500 focus:outline-none focus:underline transition ease-in-out duration-150"
  end

  private def title_text
    "Sign in"
  end
end
