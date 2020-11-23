class SignUpConfirmationRequests::NewPage < AuthLayout
  needs operation : RequestSignUpConfirmation

  def page_title
    "New email confirmation"
  end

  def content
    mount Shared::CenteredFormPanel, title: page_title do
      render_form(operation)
    end
  end

  private def render_form(op)
    form_for SignUpConfirmationRequests::Create do
      mount Shared::Field, op.email, "Email", &.email_input(autofocus: "true", placeholder: "you@example.com")

      div class: "mt-6" do
        span class: "block w-full rounded-md shadow-sm" do
          submit "Request confirmation", class: "w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-primary-600 hover:bg-primary-500 cursor-pointer focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700 transition duration-150 ease-in-out", flow_id: "request-sign-up-confirmation-button"
        end
      end

      div class: "mt-6 flex flex-col sm:flex-row space-y-2 sm:space-y-0 items-center justify-between" do
        div class: "text-sm leading-5" do
          link "Sign up", to: SignUps::New, class: link_class
        end

        div class: "text-sm leading-5" do
          link "Sign in", to: SignIns::New, class: link_class
        end

        div class: "text-sm leading-5" do
          link "Forgot your password?", to: PasswordResetRequests::New, class: link_class
        end
      end
    end
  end

  private def link_class
    "font-medium text-primary-600 hover:text-primary-500 focus:outline-none focus:underline transition ease-in-out duration-150"
  end
end
