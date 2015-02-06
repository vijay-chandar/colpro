class RegistrationMailer < ApplicationMailer
	def registration_success(registration)
		@registration = registration
	    mail(to: @registration.email, subject: 'Welcome to the conference')
	end
end