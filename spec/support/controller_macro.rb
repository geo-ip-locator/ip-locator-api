module ControllerMacros
  def login_user(&proc)
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = proc ? instance_eval(&proc) : FactoryBot.create(:user)
      sign_in user
    end
  end

  def signup_user(&proc)
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = proc ? instance_eval(&proc) : FactoryBot.create(:user)
      user.save!
    end
  end
end
