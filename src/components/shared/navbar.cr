class Shared::Navbar < BaseComponent
  needs user : User?
  needs simple : Bool = false

  def render
    nav class: "bg-white shadow", data_controller: "toggle" do
      div class: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" do
        div class: "flex justify-between items-center h-16" do
          render_left_navbar

          unless simple?
            render_right_navbar(user)
          end

          div class: "-mr-2 flex items-center sm:hidden", data_action: "click->toggle#toggle" do
            render_hamburger_icon
          end
        end
      end

      div class: "hidden sm:hidden", data_toggle_target: "toggleable" do
        render_hamburger_menu(user)
      end
    end
  end

  private def render_left_navbar
    div class: "flex" do
      div class: "flex-shrink-0 flex items-center" do
        render_logo
      end
    end
  end

  private def render_logo
    link "Lucky Jumpstart", to: Home::Index, class: "leading-8 font-extrabold tracking-tight text-gray-900 text-xl sm:leading-10 hover:text-gray-600"
  end

  private def render_hamburger_icon
    button aria_expanded: "false", aria_label: "Main menu", class: "inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out" do
      tag "svg", class: "block h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
        tag "path", d: "M4 6h16M4 12h16M4 18h16", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
      end
      tag "svg", class: "hidden h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
        tag "path", d: "M6 18L18 6M6 6l12 12", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
      end
    end
  end

  private def render_hamburger_menu(user : User)
    div class: "pt-2 pb-3" do
      mount UI::NavbarHamburgerButton, &.link("Home", to: Home::Index, flow_id: "nav-hamburger-home-button")
      mount UI::NavbarHamburgerButton, &.link("Sign out", to: SignIns::Delete, flow_id: "nav-hamburger-sign-out-button")
    end
  end

  private def render_hamburger_menu(no_user : Nil)
    div class: "pt-2 pb-3" do
      mount UI::NavbarHamburgerButton, &.link("Home", to: Home::Index, flow_id: "nav-hamburger-home-button")
      mount UI::NavbarHamburgerButton, &.link("Sign in", to: SignIns::New, flow_id: "nav-hamburger-sign-in-button")
      mount UI::NavbarHamburgerButton, &.link("Sign up", to: SignUps::New, flow_id: "nav-hamburger-sign-up-button")
    end
  end

  private def render_right_navbar(user : User)
    div class: "hidden sm:flex sm:space-x-2 items-center" do
      link user.email, to: Me::Show, class: "text-sm font-medium text-gray-900 hover:text-gray-600"

      mount UI::Button, &.link("Sign Out", to: SignIns::Delete, flow_id: "nav-sign-out-button")
    end
  end

  private def render_right_navbar(no_user : Nil)
    div class: "hidden sm:flex sm:space-x-2 items-center" do
      mount UI::Button, &.link("Sign In", to: SignIns::New, flow_id: "nav-sign-in-button")
      mount UI::Button, &.link("Sign Up", to: SignUps::New, flow_id: "nav-sign-up-button")
    end
  end
end
