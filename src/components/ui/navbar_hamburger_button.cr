class UI::NavbarHamburgerButton < BaseComponent
  TEXT_COLOR_DEFAULT = "text-gray-600"
  TEXT_COLOR_HOVER   = "text-gray-800"
  TEXT_COLOR_FOCUS   = "text-gray-800"

  BUTTON_BACKGROUND_HOVER = "bg-gray-50"
  BUTTON_BACKGROUND_FOCUS = "bg-gray-50"

  BUTTON_BORDER_HOVER = "border-gray-300"
  BUTTON_BORDER_FOCUS = "border-gray-300"

  def render
    tag_defaults class: button_classes do |button_builder|
      yield button_builder
    end
  end

  private def button_classes
    [
      "mt-1",
      "block",
      "pl-3",
      "pr-4",
      "py-2",
      "border-l-4",
      "border-transparent",
      "text-base",
      "font-medium",
      "#{TEXT_COLOR_DEFAULT}",
      "hover:#{TEXT_COLOR_HOVER}",
      "hover:#{BUTTON_BACKGROUND_HOVER}",
      "hover:#{BUTTON_BORDER_HOVER}",
      "focus:outline-none",
      "focus:#{TEXT_COLOR_FOCUS}",
      "focus:#{BUTTON_BACKGROUND_FOCUS}",
      "focus:#{BUTTON_BORDER_FOCUS}",
      "transition",
      "duration-150",
      "ease-in-out",
    ].join(" ")
  end
end
