class UserMailer < ApplicationMailer
    default from: 'no-reply@empleosinternos.com'
  
    def new_application_notification(application)
      @application = application
      mail(to: 'esteban@example.com', subject: 'Nueva Postulación')
    end
  end
  