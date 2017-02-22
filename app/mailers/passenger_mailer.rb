class PassengerMailer < ApplicationMailer
	def thankyou(booking)
		@booking = booking
		@recipient = @booking.passengers.first
		mail(to: @recipient.email, subject: 'Your Flight Has Been Booked!')
	end
end
