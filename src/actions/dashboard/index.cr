class Dashboard::Index < BrowserAction
  get "/dashboard" do
    html Dashboard::IndexPage
  end
end
