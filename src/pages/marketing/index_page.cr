class Marketing::IndexPage < AuthLayout
  def content
    div class: "relative bg-gray-50 overflow-hidden" do
      render_background
      render_hero
      render_features
    end
  end

  private def render_background
    div class: "hidden sm:block sm:absolute sm:inset-y-0 sm:h-full sm:w-full" do
      div class: "relative h-full max-w-screen-xl mx-auto" do
        render_right_rectangle_background
      end
    end
  end

  private def render_hero
    div class: "relative pt-6 pb-12 sm:pb-16 md:pb-20 lg:pb-28 xl:pb-32" do
      main class: "mt-10 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-16 lg:mt-20 xl:mt-28" do
        div class: "text-center" do
          h2 class: "text-4xl tracking-tight leading-10 font-extrabold text-gray-900 sm:text-5xl sm:leading-none md:text-6xl" do
            text "Let's build an"
            br class: "xl:hidden"
            span " app!", class: "text-indigo-600"
          end
          para class: "mt-3 max-w-md mx-auto text-base text-gray-500 sm:text-lg md:mt-5 md:text-xl md:max-w-3xl" do
            text " Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo. Elit sunt amet fugiat veniam occaecat fugiat aliqua. "
          end
          div class: "mt-5 max-w-md mx-auto sm:flex sm:justify-center md:mt-8" do
            div class: "rounded-md shadow" do
              link "Sign up", to: SignUps::New, class: "w-full flex items-center justify-center px-8 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo transition duration-150 ease-in-out md:py-4 md:text-lg md:px-10"
            end
            div class: "mt-3 rounded-md shadow sm:mt-0 sm:ml-3" do
              link "Sign in", to: SignIns::New, class: "w-full flex items-center justify-center px-8 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-indigo-600 bg-white hover:text-indigo-500 focus:outline-none focus:border-indigo-300 focus:shadow-outline-indigo transition duration-150 ease-in-out md:py-4 md:text-lg md:px-10"
            end
          end
        end
      end
    end
  end

  private def render_features
    div class: "py-12 bg-white" do
      div class: "max-w-screen-xl mx-auto px-4 sm:px-6 lg:px-8" do
        div class: "lg:text-center" do
          para "Features", class: "text-base leading-6 text-indigo-600 font-semibold tracking-wide uppercase"
          h3 class: "mt-2 text-3xl leading-8 font-extrabold tracking-tight text-gray-900 sm:text-4xl sm:leading-10" do
            text "A better way to show people your features"
          end
          para class: "mt-4 max-w-2xl text-xl leading-7 text-gray-500 lg:mx-auto" do
            text " Lorem ipsum dolor sit amet consect adipisicing elit. Possimus magnam voluptatum cupiditate veritatis in accusamus quisquam. "
          end
        end
        div class: "mt-10" do
          ul class: "md:grid md:grid-cols-2 md:col-gap-8 md:row-gap-10" do
            li do
              div class: "flex" do
                div class: "flex-shrink-0" do
                  div class: "flex items-center justify-center h-12 w-12 rounded-md bg-indigo-500 text-white" do
                    tag "svg", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                      tag "path", d: "M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                    end
                  end
                end
                div class: "ml-4" do
                  h4 "Very round icons!", class: "text-lg leading-6 font-medium text-gray-900"
                  para class: "mt-2 text-base leading-6 text-gray-500" do
                    text " Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione. "
                  end
                end
              end
            end
            li class: "mt-10 md:mt-0" do
              div class: "flex" do
                div class: "flex-shrink-0" do
                  div class: "flex items-center justify-center h-12 w-12 rounded-md bg-indigo-500 text-white" do
                    tag "svg", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                      tag "path", d: "M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                    end
                  end
                end
                div class: "ml-4" do
                  h4 "These scales aren't tipped!", class: "text-lg leading-6 font-medium text-gray-900"
                  para class: "mt-2 text-base leading-6 text-gray-500" do
                    text " Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione. "
                  end
                end
              end
            end
            li class: "mt-10 md:mt-0" do
              div class: "flex" do
                div class: "flex-shrink-0" do
                  div class: "flex items-center justify-center h-12 w-12 rounded-md bg-indigo-500 text-white" do
                    tag "svg", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                      tag "path", d: "M13 10V3L4 14h7v7l9-11h-7z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                    end
                  end
                end
                div class: "ml-4" do
                  h4 "And lighting!", class: "text-lg leading-6 font-medium text-gray-900"
                  para class: "mt-2 text-base leading-6 text-gray-500" do
                    text " Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione. "
                  end
                end
              end
            end
            li class: "mt-10 md:mt-0" do
              div class: "flex" do
                div class: "flex-shrink-0" do
                  div class: "flex items-center justify-center h-12 w-12 rounded-md bg-indigo-500 text-white" do
                    tag "svg", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                      tag "path", d: "M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                    end
                  end
                end
                div class: "ml-4" do
                  h4 "Type the things!", class: "text-lg leading-6 font-medium text-gray-900"
                  para class: "mt-2 text-base leading-6 text-gray-500" do
                    text " Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione. "
                  end
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
