# Note: going to /auth/twitter in the browser won't work anymore, just click the button instead
class OmniauthCallbacksController < ApplicationController
  before_action :require_user_logged_in!

  def twitter
    # Rails.logger.info auth
    Rails.logger.info auth.info

    # Need to have Elevated access in twitter project to access the name/username/image
    # Query the db -
    # Do you have a record with this user name?
    # If present, give the first one
    # else give a new twitter account with that username assigned
    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )

    redirect_to twitter_accounts_path, notice: "Successfully connected your account"
  end

  def auth
    request.env['omniauth.auth'] #convenience method
  end

end