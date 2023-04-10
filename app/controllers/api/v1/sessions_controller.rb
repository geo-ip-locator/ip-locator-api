class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    params = login_params
    user = User.find_by_email(params['email'].downcase)

    if user.valid_password?(params['password']) then
      sign_in(user)
      render json: { message: I18n.translate('api.v1.sessions.success') }, status: :ok
    else
      render json: { message: I18n.translate('api.v1.sessions.failure') }, status: :unprocessable_entity
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: { message: I18n.translate('api.v1.sessions.logged_out') }, status: :ok
  end

  private
  def login_params
    params.require(:user).permit!()
  end
end
