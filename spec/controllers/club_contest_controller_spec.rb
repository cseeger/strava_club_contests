require 'spec_helper'

describe ClubContestController do
  render_views

  describe '#index' do
    before do
      FactoryGirl.create(:populated_leaderboard).leaderboard_line_items.count.should == 1
    end

    it "should render index template" do
      get :index
      response.should render_template(:index)
    end
    it 'assigns first club by default' do
      get :index
      assigns(:club).should == Club.first
    end
  end
end

