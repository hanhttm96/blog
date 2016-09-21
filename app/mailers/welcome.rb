class Welcome < ApplicationMailer

  default :from => "myhanhqt96@gmail.com"

  def thankregister(email, password)
    mail :to => email, :subject => "Thank for register"
  end
end
