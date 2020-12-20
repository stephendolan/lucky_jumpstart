# This component is used to make it easier to render the same fields styles
# throughout your app.
#
# Extensive documentation at: https://luckyframework.org/guides/frontend/html-forms#shared-components
#
# ## Basic usage:
#
#    # Renders a text input by default and will guess the label name "Name"
#    mount Shared::Field, op.name
#    # Call any of the input methods on the block
#    mount Shared::Field, op.email, &.email_input
#    # Add other HTML attributes
#    mount Shared::Field, op.email, &.email_input(autofocus: "true")
#    # Pass an explicit label name
#    mount Shared::Field, op.username, "Your username"
#
# ## Customization
#
# You can customize this component so that fields render like you expect.
# For example, you might wrap it in a div with a "field-wrapper" class.
#
#    div class: "field-wrapper"
#      label_for field
#      yield field
#      mount Shared::FieldErrors, field
#    end
#
# You may also want to have more components if your fields look
# different in different parts of your app, e.g. `CompactField` or
# `InlineTextField`
class Shared::Field(T) < BaseComponent
  # Raises a helpful error if component receives an unpermitted attribute
  include Lucky::CatchUnpermittedAttribute

  needs attribute : Avram::PermittedAttribute(T)
  needs label_text : String?

  def render
    div do
      mount Shared::FieldLabel, attribute, label_text

      div class: "mt-1 relative rounded-md shadow-sm" do
        tag_defaults field: attribute, class: input_classes do |input_builder|
          yield input_builder
        end

        render_warning_symbol unless attribute.valid?
      end

      mount Shared::FieldErrors, attribute
    end
  end

  # Use a text_input by default
  def render
    render &.text_input
  end

  private def render_warning_symbol
    div class: "absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none" do
      tag "svg", class: "h-5 w-5 text-red-500", fill: "currentColor", viewBox: "0 0 20 20" do
        tag "path", clip_rule: "evenodd", d: "M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z", fill_rule: "evenodd"
      end
    end
  end

  private def input_classes
    base_classes = "block w-full sm:text-sm rounded-md"

    valid_classes = "#{base_classes} focus:ring-primary-500 focus:border-primary-500 border-gray-300"
    error_classes = "#{base_classes} pr-10 border-red-300 text-red-700 placeholder-red-300 focus:outline-none focus:ring-red-500 focus:border-red-500"

    if attribute.valid?
      valid_classes
    else
      error_classes
    end
  end
end
