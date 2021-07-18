class SignIns::Delete < BrowserAction
  delete "/sign_out" do
    sign_out
    redirect to: SignIns::New
  end
end
