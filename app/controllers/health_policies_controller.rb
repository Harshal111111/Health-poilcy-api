class HealthPoliciesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  
  def create
    @health_policy = HealthPolicy.new(health_policy_params)
    if @health_policy.save
        render json: @health_policy, status: :created
    else
        render json: @health_policy.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  def health_policy_params
    params.require(:health_policy).permit(:name, :expiry, :user_id)
  end
  
  def authorize_admin!
    authorize User, :create?
  end
end
  