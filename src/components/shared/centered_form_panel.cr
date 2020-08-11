class Shared::CenteredFormPanel < BaseComponent
  needs title : String

  def render
    div class: "min-h-screen -mt-32 flex flex-col justify-center py-12 sm:px-6 lg:px-8" do
      h2 class: "mt-6 text-center text-3xl leading-9 font-extrabold text-gray-900" do
        text title
      end

      div class: "mt-6 sm:mx-auto sm:w-full sm:max-w-md" do
        div class: "bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10" do
          yield
        end
      end
    end
  end
end
