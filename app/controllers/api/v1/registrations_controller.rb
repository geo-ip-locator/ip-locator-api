class Api::V1::RegistrationsController < Devise::SessionsController
  respond_to :json

  def create
    @user = User.create(sign_up_params)

    if @user.save!
      render json: { message: I18n.translate('api.v1.registrations.success') }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password)
  end
end
