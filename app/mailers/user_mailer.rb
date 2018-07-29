class UserMailer < ApplicationMailer
	def welcome
		@product=params[:product]
		mail(to: 'kadikoyluseren@gmail.com', subject: 'Hello')
	end
end
