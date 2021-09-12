BaseEmail.configure do |settings|
  if LuckyEnv.production?
    # If you don't plan to send emails from production, leave this as it is.
    #
    # If you *do* plan to send emails, you'll need to use a Carbon Adapter. Check out a list of adapters here:
    # https://github.com/luckyframework/carbon#adapters
    settings.adapter = Carbon::DevAdapter.new
  elsif LuckyEnv.development?
    settings.adapter = Carbon::DevAdapter.new(print_emails: true)
  else
    settings.adapter = Carbon::DevAdapter.new
  end
end
