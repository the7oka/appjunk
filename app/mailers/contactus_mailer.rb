class ContactusMailer < ApplicationMailer
	default from: 'notifications@appjunk.com'
 
  def notification_email
    mail(to: 'mah.mostafa@icloud.com', subject: 'Youve got a contactme')
  end
end
