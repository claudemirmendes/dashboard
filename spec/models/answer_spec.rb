require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe Answer, :type => :model do
  describe "#create_average" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:avaliation) { FactoryGirl.create(:avaliation, user: user) }

    context "creating answer" do
      let(:answer_params) do
        {
          average: 6
        }
      end

      it "create one answer" do
        answer = Answer.create_average(answer_params)
        answer_create = Answer.where(avaliation_id: avaliation.id)

        expect(answer_create.size).to be(1)
      end
    end
  end
end
