class CampaignsController < ApplicationController
  def show
    redirect_to root_path unless current_user
    @campaign = Campaign.find(params[:id])
  end
end