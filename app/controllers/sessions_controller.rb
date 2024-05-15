class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      # Authentication successful
      token = JwtService.encode(user_id: user.id)
      render json: { user: user.as_json(only: [:id, :email]), token: token }, status: :ok
    else
      # Authentication failed
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
  def destroy
    cookies.delete(:jwt_token)
    render json: "Logged Out Successfully"
  end
end
