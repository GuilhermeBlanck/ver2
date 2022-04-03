class Admins::SessionsController < Devise::SessionsController
    skip_before_action :verify_signed_out_user, only: :destroy
    def create
    
        self.resource = warden.authenticate(auth_options)
        if self.resource.nil?
            head(:unauthorized); return
        end

        sign_in(resource_name, resource)
        respond_with_authentication_token(resource)

    end

    def destroy
        @u = Admin.find(params[:admin][:id]) if (params[:admin].present? && params[:admin][:id].present?)
        if @u&.nil? || params[:admin][:token].nil? || params[:admin][:token] != @u.authentication_token
            head(:unauthorized); return
        end
        @u.authentication_token = nil
        @u.save
        render json: {message: 'Session ended, token expired'}
    end

    protected

    def respond_with_authentication_token(resource)
        render json: {
        success: true,
        auth_token: resource.authentication_token,
        email: resource.email,
        id: resource.id
        }
    end

end