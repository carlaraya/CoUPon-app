class StudentMailer < ApplicationMailer
  def confirm_email(user)
    @user = user
    @url = student_confirm_url(@user.token)
  end
end
