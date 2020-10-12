if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_daily_guidance', domain: 'daily_guidance-json-api'
  else
    Rails.application.config.session_store :cookie_store, key: '_daily_guidance'
  end
