class SendAverageMailer < ApplicationMailer

 def send_email_to_member(member,avaliation)
  @member = member
  @avaliation = avaliation[0]
  byebug
  mail(to: @member.email,from:"noreply@tfsolutions.com.br", subject: 'PESQUISA DE SATISFAÇÃO') do |format|
    format.html { render '/avaliations/send_average_mailer.html.erb'} 
  end
end
end

