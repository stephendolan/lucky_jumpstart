class Me::EditPage < MainLayout
  needs operation : SaveUserSettings
  needs user : User

  def page_title
    "Your Profile"
  end

  def content
    section class: "max-w-7xl mx-auto py-6 sm:px-6 lg:px-8" do
      div class: "bg-white overflow-hidden shadow rounded-none sm:rounded-lg" do
        div class: "px-4 py-5 border-b border-gray-200 sm:px-6" do
          div class: "-ml-4 -mt-2 flex items-center justify-between flex-wrap sm:flex-nowrap" do
            div class: "ml-4 mt-2" do
              h1 class: "text-lg leading-6 font-medium text-gray-900" do
                text "Your profile"
              end
            end
          end
        end

        div do
          render_settings_page
        end
      end
    end
  end

  private def render_settings_page
    render_basic_info_header
    render_user_form
  end

  private def render_basic_info_header
    div class: "flex items-center space-x-2 px-4 sm:px-6 border-b py-4 bg-gray-50" do
      figure do
        img src: user.image, class: "w-12 h-auto rounded-full"
      end

      div class: "flex-1" do
        h2 "Basic information", class: "text-lg leading-6 font-medium text-gray-900"
        para class: "mt-1 text-sm text-gray-500" do
          text "This information will be displayed publicly, so be careful what you share. "
        end
      end
    end
  end

  private def render_user_form
    form_for Me::Update do
      div class: "space-y-6 px-4 sm:px-6 pb-6" do
        mount Users::FormFields, operation

        mount UI::Button, &.submit("Update my settings", flow_id: "submit-user-button", data_disable_with: "Updating...")
      end
    end
  end
end
