class Ping::Index < Lucky::Action
  accepted_formats [:html], default: :html

  get "/ping" do
    head 200
  end
end
