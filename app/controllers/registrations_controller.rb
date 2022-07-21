class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Successfully created account"
    else
      # flash[:alert] = "Something was wrong"
      render :new #this renders views/registrations/new.html.erb
    end

    # params[:user] is {"email"=>"test@test.com", "password"=>"1", "password_confirmation"=>"1"}
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


end