class ApplicationController < ActionController::Base
  protect_from_forgery
  # require 'oauth/consumer'

  # def login_twitter
  #   oauth_consumer = OAuth::Consumer.new(getTwitterConsumerKey(), getTwitterConsumerSecret(), {:site => 'http://twitter.com'})

  #   request_token = oauth_consumer.get_request_token({
  #     :oauth_callback => "#{getAppUrl()}login/twitter/callback"
  #   })

  #   session[:request_token] = request_token.token
  #   session[:request_token_secret] = request_token.secret

  #   redirect_to request_token.authorize_url
  # end

  # def login_twitter_callback

  #   str_error = "There was an error trying to login to your Facebook account, please try again."

  #   begin
  #     oauth_consumer = OAuth::Consumer.new(getTwitterConsumerKey(), getTwitterConsumerSecret(), {:site => 'http://twitter.com'})

  #     request_token = OAuth::RequestToken.new(oauth_consumer, session[:request_token], session[:request_token_secret])

  #     session[:request_token] = nil
  #     session[:request_token_secret] = nil

  #     access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])

  #     response = access_token.get('/account/verify_credentials.json')

  #     twitter_user_info = case response
  #       when Net::HTTPSuccess
  #         JSON.parse(response.body)
  #       else
  #         flash[:error] = str_error
  #         redirect_to '/login'
  #     end

  #     user = {
  #       :id     => twitter_user_info['id'],
  #       :name   => twitter_user_info['name'],
  #       :username => twitter_user_info['screen_name'],
  #       :token  => access_token.token,
  #       :secret => access_token.secret
  #     }

  #     doTwitterLogin(user)

  #     flash[:notice] = "You have logged in successfully."
  #     redirect_to '/items'
  #   rescue OAuth::Unauthorized
  #     flash[:error] = str_error
  #     redirect_to '/login'
  #   end
  # end
end
