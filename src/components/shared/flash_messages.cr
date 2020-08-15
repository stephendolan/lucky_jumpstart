class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    flash.each do |_flash_type, flash_message|
      div data_controller: "removable", class: "fixed inset-0 flex items-end justify-center px-4 py-6 pointer-events-none sm:p-6 sm:justify-end" do
        div class: "max-w-sm w-full bg-white shadow-lg rounded-lg pointer-events-auto" do
          div class: "rounded-lg shadow-xs overflow-hidden" do
            div class: "p-4" do
              div class: "flex items-center" do
                div class: "w-0 flex-1 flex justify-between" do
                  para class: "w-0 flex-1 text-sm leading-5 font-medium text-gray-900", flow_id: "flash" do
                    text flash_message
                  end
                end
                div class: "ml-4 flex-shrink-0 flex" do
                  button data_action: "click->removable#remove", class: "inline-flex text-gray-400 focus:outline-none focus:text-gray-500 transition ease-in-out duration-150" do
                    tag "svg", class: "h-5 w-5", fill: "currentColor", viewBox: "0 0 20 20" do
                      tag "path", clip_rule: "evenodd", d: "M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z", fill_rule: "evenodd"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
