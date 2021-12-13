abstract class MainLayout
  include Lucky::HTMLPage

  # 'needs current_user : User' makes it so that the current_user
  # is always required for pages using MainLayout
  needs current_user : User

  abstract def content
  abstract def page_title

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title

      body class: "font-inter min-h-screen bg-gray-100" do
        mount Shared::Navbar, user: current_user
        mount Shared::FlashMessages, context.flash

        main do
          div class: "max-w-7xl mx-auto py-6 sm:px-6 lg:px-8" do
            content
          end
        end
      end
    end
  end
end
