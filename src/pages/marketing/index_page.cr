class Marketing::IndexPage < AuthLayout
  def content
    div class: "relative bg-gray-50 overflow-hidden" do
      render_hero
      render_features
    end
  end

  private def render_hero
    div class: "relative bg-white overflow-hidden border-b" do
      div class: "max-w-7xl mx-auto" do
        div class: "relative z-10 pb-8 bg-white sm:pb-16 md:pb-20 lg:max-w-2xl lg:w-full lg:pb-28 xl:pb-32" do
          tag "svg", aria_hidden: "true", class: "hidden lg:block absolute right-0 inset-y-0 h-full w-48 text-white transform translate-x-1/2", fill: "currentColor", preserveAspectRatio: "none", viewBox: "0 0 100 100" do
            tag "polygon", points: "50,0 100,0 50,100 0,100"
          end
          main class: "pt-10 mx-auto max-w-7xl px-4 sm:pt-12 sm:px-6 md:pt-16 lg:pt-20 lg:px-8 xl:pt-28" do
            div class: "sm:text-center lg:text-left" do
              h1 class: "text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl" do
                span "Jumpstart your", class: "block xl:inline"
                span " Lucky development", class: "block text-primary-600 xl:inline"
              end
              para class: "mt-3 text-base text-gray-500 sm:mt-5 sm:text-lg sm:max-w-xl sm:mx-auto md:mt-5 md:text-xl lg:mx-0" do
                text " Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo. Elit sunt amet fugiat veniam occaecat fugiat aliqua. "
              end
              div class: "mt-5 sm:mt-8 sm:flex sm:justify-center lg:justify-start" do
                div class: "rounded-md shadow" do
                  link "Sign up", to: SignUps::New, class: "w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-primary-600 hover:bg-primary-700 md:py-4 md:text-lg md:px-10", flow_id: "sign-up-button"
                end

                div class: "mt-3 sm:mt-0 sm:ml-3" do
                  link "Sign in", to: SignIns::New, class: "w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-primary-700 bg-primary-100 hover:bg-primary-200 md:py-4 md:text-lg md:px-10", flow_id: "sign-in-button"
                end
              end
            end
          end
        end
      end
      div class: "hidden lg:block lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2" do
        img alt: "", class: "h-56 w-full object-cover sm:h-72 md:h-96 lg:w-full lg:h-full", src: "https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80"
      end
    end
  end

  private def render_features
    div class: "py-12 bg-white" do
      div class: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" do
        div class: "lg:text-center" do
          h2 "Features", class: "text-base text-indigo-600 font-semibold tracking-wide uppercase"

          para class: "mt-2 text-3xl leading-8 font-extrabold tracking-tight text-gray-900 sm:text-4xl" do
            text "The Swiss army knife of Lucky apps"
          end

          para class: "mt-4 max-w-2xl text-xl text-gray-500 lg:mx-auto" do
            text " Lorem ipsum dolor sit amet consect adipisicing elit. Possimus magnam voluptatum cupiditate veritatis in accusamus quisquam. "
          end
        end
        div class: "mt-10" do
          dl class: "space-y-10 md:space-y-0 md:grid md:grid-cols-2 md:gap-x-8 md:gap-y-10" do
            div class: "flex" do
              div class: "flex-shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-indigo-500 text-white" do
                  tag "svg", aria_hidden: "true", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "TailwindCSS ready to use"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text " Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione. "
                end
              end
            end
            div class: "flex" do
              div class: "flex-shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-indigo-500 text-white" do
                  tag "svg", aria_hidden: "true", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Docker out of the box"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text " Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione. "
                end
              end
            end
            div class: "flex" do
              div class: "flex-shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-indigo-500 text-white" do
                  tag "svg", aria_hidden: "true", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M13 10V3L4 14h7v7l9-11h-7z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Email confirmations included"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text " Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione. "
                end
              end
            end
            div class: "flex" do
              div class: "flex-shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-indigo-500 text-white" do
                  tag "svg", aria_hidden: "true", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Get running fast!"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text " Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione. "
                end
              end
            end
          end
        end
      end
    end
  end

  private def render_right_rectangle_background
    tag "svg", class: "absolute left-full transform -translate-y-3/4 -translate-x-1/4 md:-translate-y-1/2 lg:-translate-x-1/2", fill: "none", height: "784", viewBox: "0 0 404 784", width: "404" do
      rectangle_background
    end
  end

  private def rectangle_background
    tag "defs" do
      tag "pattern", height: "20", id: "5d0dd344-b041-4d26-bec4-8d33ea57ec9b", patternUnits: "userSpaceOnUse", width: "20", x: "0", y: "0" do
        tag "rect", class: "text-gray-200", fill: "currentColor", height: "4", width: "4", x: "0", y: "0"
      end
    end
    tag "rect", fill: "url(#5d0dd344-b041-4d26-bec4-8d33ea57ec9b)", height: "784", width: "404"
  end
end
