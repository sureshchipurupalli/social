
#Rails.application.config.settings["oauth2"] = {} if Rails.env.test?

Rails.application.config.middleware.use OmniAuth::Builder do
 #  config = Rails.application.config.settings["oauth2"]
#  provider :google_oauth2, "115059498414-5fj2in117vueg4a1tdg52f61d0k07hnp.apps.googleusercontent.com",
 #                          "ZbPzUjSKpYRTmGXW2uqhIRfc",
  #                         image_size: 150
  
   provider :twitter, "HnA4m6IzaZ1haT9n4r8jFr7fm",  "SsL6TiWFLkKDWnta5zRek7YBvwfPBfMEiNYWRVL0m0PSZzXEHW"
   provider :facebook, "356781284673265",  "1686997c451aecfd12dc7be56f1c61f1",
            scope: 'public_profile', info_fields: 'id,name,link'


  provider :google_oauth2, "144260308654-viqjoqr954po297ke1tb5auidlvttanr.apps.googleusercontent.com",  "BvwwEDi0N9Q4EdQtdAKlw7Zy",
           scope: "email,profile", prompt: "select_account",  image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google',
           access_type: "offline", skip_jwt: true, info_fields: 'id,name,link'

 
          # scope: 'r_basicprofile', info_fields: 'id,name,link'
          #fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']

#  provider :google_oauth2, "115059498414-5fj2in117vueg4a1tdg52f61d0k07hnp.apps.googleusercontent.com",  "ZbPzUjSKpYRTmGXW2uqhIRfc",
          # scope: ['userinfo.email','userinfo.profile'], image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google',
          # access_type: "offline", skip_jwt: true, prompt: "select_account", info_fields: 'id,name,link'

  provider :google_oauth2, "115059498414-ejdliqnra5lp7v64h0bhkohfm6vscoak.apps.googleusercontent.com",  "nIWlcwxux0N8IoBuDq-w46oe",
    {
      :name => "google",
      :scope => "email, profile, plus.me",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :info_fields => "id,name,link",
      :image_size => 50
    }

 # provider :google_oauth2, "115059498414-ejdliqnra5lp7v64h0bhkohfm6vscoak.apps.googleusercontent.com", "nIWlcwxux0N8IoBuDq-w46oe", {
#    :scope => 'email,profile'
 # }




  provider :linkedin, "811sfh8hnyr0dg",  "Pe2wtfRbt7mCJNdF",
           scope: 'r_basicprofile'
#           fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']


  OmniAuth.config.on_failure = Proc.new do |env|
    SessionsController.action(:auth_failure).call(env)
    error_type = env['omniauth.error.type']
    new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
     [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
  end
end
