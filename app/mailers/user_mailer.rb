class UserMailer < ApplicationMailer

  def register_user(register_params)
    @user_name = "#{register_params.first_name} #{register_params.last_name}"
    @password = register_params.password

    mail(to: @user.email, subject: 'Register User')
  end

  def test(params)
    @user_name = "#{register_params.first_name} #{register_params.last_name}"
    @password = register_params.password

    mail(to: "guix7777@outlook.com", subject: 'Test Mail')
  end
end
