Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, ENV['1B1pwivGlqK3RxPet4UpTuyof'], ENV['mlYfRBoVsWVioFETWOcGjvVPnwiYvolovS8MCdBdOF1H7utSEj']
   provider :twitter, " 1B1pwivGlqK3RxPet4UpTuyof",  " mlYfRBoVsWVioFETWOcGjvVPnwiYvolovS8MCdBdOF1H7utSEj"
   provider :facebook, "356781284673265",  "1686997c451aecfd12dc7be56f1c61f1",
            scope: 'public_profile', info_fields: 'id,name,link'

  provider :google_oauth2, "144260308654-viqjoqr954po297ke1tb5auidlvttanr.apps.googleusercontent.com",  "BvwwEDi0N9Q4EdQtdAKlw7Zy",
           scope: "email,profile", prompt: "select_account",  image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google',
           access_type: "offline", skip_jwt: true, info_fields: 'id,name,link'

  provider :linkedin, "811sfh8hnyr0dg",  "Pe2wtfRbt7mCJNdF",
          # scope: 'r_basicprofile', info_fields: 'id,name,link'
          #fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']

  OmniAuth.config.on_failure = Proc.new do |env|
    SessionsController.action(:auth_failure).call(env)
    error_type = env['omniauth.error.type']
    new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
     [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
  end
end