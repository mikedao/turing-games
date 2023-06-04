class CampaignUsersController < ApplicationController
  def create
    CampaignUser.create(campaign_id: params[:campaign], user_id: params[:user])
    redirect_to campaign_path(params[:campaign])
  end

end