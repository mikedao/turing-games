class CampaignUsersController < ApplicationController
  def create
    binding.pry
    CampaignUser.create(campaign_id: params[:campaign], user_id: params[:user])
    binding.pry
    redirect_to campaign_path(params[:campaign])
  end

  def destroy
    CampaignUser.find_by(campaign_id: params[:campaign], user_id: params[:user]).destroy
    redirect_to campaign_path(params[:campaign])
  end
end