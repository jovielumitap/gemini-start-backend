class UserMailer < ApplicationMailer

  def register_user(register_params)
    @user_name = "#{register_params.first_name} #{register_params.last_name}"
    @password = register_params.password

    mail(to: @user.email, subject: 'Register User')
  end
end
