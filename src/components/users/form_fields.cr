class Users::FormFields < BaseComponent
  needs operation : SaveUserSettings

  def render
    div class: "mt-6 grid grid-cols-12 gap-6" do
      if (user = operation.record)
        div class: "col-span-12" do
          mount Shared::Field, operation.readonly_email, "Email", &.email_input(attrs: [:disabled], value: user.email, append_class: "bg-gray-50")
        end
      end

      div class: "col-span-12 sm:col-span-6" do
        mount Shared::Field, operation.first_name, &.text_input(autocomplete: "given-name")
      end

      div class: "col-span-12 sm:col-span-6" do
        mount Shared::Field, operation.last_name, &.text_input(autocomplete: "family-name")
      end
    end
  end
end
