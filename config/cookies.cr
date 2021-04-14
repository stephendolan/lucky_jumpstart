require "./server"

Lucky::Session.configure(&.key=("_lucky_jumpstart_session"))

Lucky::CookieJar.configure do |settings|
  settings.on_set = ->(cookie : HTTP::Cookie) {
    # If ForceSSLHandler is enabled, only send cookies over HTTPS
    cookie.secure(Lucky::ForceSSLHandler.settings.enabled)

    # By default, don't allow reading cookies with JavaScript
    cookie.http_only(true)

    # Restrict cookies to a first-party or same-site context
    cookie.samesite(:lax)

    # Set all cookies to the root path by default
    cookie.path("/")

    # You can set other defaults for cookies here. For example:
    #
    #    cookie.expires(1.year.from_now).domain("mydomain.com")
  }
end
