Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_API_KEY'], ENV['FACEBOOK_SECRET_TOKEN'], {
    provider_ignores_state: true
  }

end