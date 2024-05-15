class UsersController < ApplicationController
  before_action :authenticate_user! 
  def details
    @user = current_user
    render json: {
      name: @user.name,
      dob: @user.dob,
      mobile_number: @user.mobile_number,
      documents: @user.documents,
      health_policies: @user.health_policies
    }
  end
end
  