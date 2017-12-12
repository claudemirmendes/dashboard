require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe Avaliation, :type => :model do


  describe "#is_finished" do

    let!(:user) { FactoryGirl.create(:user) }
    let!(:avaliation) { FactoryGirl.create(:avaliation, user: user) }
    let!(:avaliation_finished) { FactoryGirl.create(:avaliation, user: user,finished:  true) }

      context "avaliation is finished" do
        it "should query return one avaliation" do
          avaliations = Avaliation.is_finished
          expect(avaliations.size).to be_equal(1)
        end
      end
  end

  describe "#is_empty" do

    let!(:user) { FactoryGirl.create(:user) }
    let!(:avaliation) { FactoryGirl.create(:avaliation, user: user) }

    context "avaliation exist" do
      it "should query return 0 avaliations" do
        avaliations = Avaliation.is_empty

        expect(avaliations.size).to be_equal(1)
      end
    end
  end
  

  describe "#is_finished" do

    let!(:user) { FactoryGirl.create(:user) }
    let!(:avaliation) { FactoryGirl.create(:avaliation, user: user) }

    context "avaliation not finished" do
      it "should query return one avaliation" do
        avaliation_finished = Avaliation.finished(avaliation.id)
        query = Avaliation.where(finished:true,user_id: user.id)

        expect(query.size).to be_equal(1)
      end
    end
  end

  describe "#create_avaliation" do

    let!(:user) { FactoryGirl.create(:user) }
    let(:avaliation_params) do
    {
      description: "teste"
    }
      end

    context "creating avaliation" do
      it "should create one avaliation" do
        avaliation = Avaliation.create_avaliation(avaliation_params,user)

        expect(avaliation.user_id).to be_equal(user.id)
      end
    end
  end
end
  