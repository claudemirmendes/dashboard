class Answer < ApplicationRecord

  scope :by_avaliation_id, -> (avaliation_id) {
    where("avaliation_id = ?", avaliation_id)
  }

   def self.send_emails(members,avaliation)
    members.each do |member|
      SendAverageMailer.send_email_to_member(member,avaliation).deliver
    end
  end

  def self.create_average(answer_params)
    transaction do
      answer = Answer.new(answer_params)
      avaliation = Avaliation.where(finished: false).last
      answer.avaliation_id = avaliation.id
      answer.save
    end
  end
end
