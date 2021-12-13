class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    flash.each do |flash_type, flash_message|
      div data_controller: "removable", class: "bg-primary-600" do
        div class: "max-w-7xl mx-auto py-3 px-3 sm:px-6 lg:px-8" do
          div class: "flex items-center justify-between flex-wrap" do
            div class: "w-0 flex-1 flex items-center" do
              span class: "flex p-2 rounded-lg bg-primary-800" do
                icon_from_flash_type(flash_type)
              end
              para class: "ml-3 font-medium text-white truncate" do
                span flash_message
              end
            end
            div class: "order-2 shrink-0 sm:order-3 sm:ml-3" do
              button data_action: "click->removable#remove", class: "-mr-1 flex p-2 rounded-md hover:bg-primary-500 focus:outline-none focus:ring-2 focus:ring-white sm:-mr-2", type: "button" do
                span "Dismiss", class: "sr-only"
                tag "svg", aria_hidden: "true", class: "h-6 w-6 text-white", fill: "none", stroke: "currentColor", viewbox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                  tag "path", d: "M6 18L18 6M6 6l12 12", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
              end
            end
          end
        end
      end
    end
  end

  private def icon_from_flash_type(flash_type : String)
    case flash_type
    when "success"
      tag "svg", class: "h-6 w-6 text-white", fill: "none", stroke: "currentColor", viewbox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
        tag "path", d: "M13 10V3L4 14h7v7l9-11h-7z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
      end
    when "failure"
      tag "svg", class: "h-6 w-6 text-white", fill: "none", stroke: "currentColor", viewbox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
        tag "path", d: "M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
      end
    else
      tag "svg", aria_hidden: "true", class: "h-6 w-6 text-white", fill: "none", stroke: "currentColor", viewbox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
        tag "path", d: "M11 5.882V19.24a1.76 1.76 0 01-3.417.592l-2.147-6.15M18 13a3 3 0 100-6M5.436 13.683A4.001 4.001 0 017 6h1.832c4.1 0 7.625-1.234 9.168-3v14c-1.543-1.766-5.067-3-9.168-3H7a3.988 3.988 0 01-1.564-.317z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
      end
    end
  end
end
