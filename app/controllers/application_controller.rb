class ApplicationController < ActionController::Base
    include Pundit::Authorization
    protect_from_forgery with: :exception


    before_action :configure_permitted_parameters, if: :devise_controller?
    skip_before_action :verify_authenticity_token

  
    protected
    def authorize(record, query = nil)
        query ||= params[:action].to_s + "?"
        unless policy(record).public_send(query)
          raise Pundit::NotAuthorizedError, "not allowed to #{query} #{record}"
        end
      end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :dob, :mobile_number])
    end
  end
  