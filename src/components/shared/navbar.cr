class Shared::Navbar < BaseComponent
  needs user : User

  def render
    nav class: "bg-white shadow", data_controller: "toggle" do
      div class: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" do
        div class: "flex justify-between items-center h-16" do
          div class: "flex" do
            div class: "flex-shrink-0 flex items-center" do
              render_logo
            end

            div class: "hidden sm:ml-6 sm:flex" do
              render_desktop_nav_links
            end
          end

          div class: "hidden md:flex md:space-x-2 items-center" do
            link user.email, to: Me::Show, class: "text-sm font-medium text-color-gray-900 hover:text-gray-600"

            span class: "inline-flex rounded-md shadow-sm" do
              link "Sign out", to: SignIns::Delete, class: "inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs leading-4 font-medium rounded text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition ease-in-out duration-150", flow_id: "sign-out-button"
            end
          end

          div class: "-mr-2 flex items-center sm:hidden", data_action: "click->toggle#toggle" do
            render_hamburger_icon
          end
        end
      end

      div class: "hidden sm:hidden", data_target: "toggle.toggleable" do
        render_hamburger_menu
      end
    end
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

  private def render_hamburger_menu
    div class: "pt-2 pb-3" do
      link "Home", to: Home::Index, class: "mt-1 block pl-3 pr-4 py-2 border-l-4 border-transparent text-base font-medium text-gray-600 hover:text-gray-800 hover:bg-gray-50 hover:border-gray-300 focus:outline-none focus:text-gray-800 focus:bg-gray-50 focus:border-gray-300 transition duration-150 ease-in-out"
      link "Sign out", to: SignIns::Delete, class: "mt-1 block pl-3 pr-4 py-2 border-l-4 border-transparent text-base font-medium text-gray-600 hover:text-gray-800 hover:bg-gray-50 hover:border-gray-300 focus:outline-none focus:text-gray-800 focus:bg-gray-50 focus:border-gray-300 transition duration-150 ease-in-out"
    end
  end

  private def render_logo
    link "Lucky Jumpstart", to: Home::Index, class: "leading-8 font-extrabold tracking-tight text-gray-900 text-xl sm:leading-10 hover:text-gray-600"
  end

  private def render_desktop_nav_links
  end
end
