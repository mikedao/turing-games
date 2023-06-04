class Admin::DashboardController < Admin::BaseController  
  def index
    @campaigns = Campaign.all
  end 
end