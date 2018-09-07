class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @user = user
    mail to: user.email, subject: "Instagramの確認メール"
  end
  
  def new
    @blog = blog
  end
end
