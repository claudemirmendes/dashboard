class AnswerMailer < ApplicationMailer
  

  def send_email_to_member(member,avaliation)
    @member = member
    @avaliation = avaliation
    mail(to: @member.email,from:"noreply@tfsolutions.com.br", subject: 'PESQUISA DE SATISFAÇÃO') do |format|
      format.html { render '/answers/answer_mailer.html.erb'} 
           end
  end
end
