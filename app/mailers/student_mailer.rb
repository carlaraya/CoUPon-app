class StudentMailer < ApplicationMailer
  def confirm_email(user)
    @user = user
    @url = student_confirm_url(token: @user.token)
    mail(to: @user.email, subject: 'CoUPon: confirm application form')
  end
end
