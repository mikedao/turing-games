class Admin::Campaigns::ImageController < Admin::BaseController

  def destroy
    campaign = Campaign.find(params[:campaign_id])
    campaign.image.purge_later
    redirect_to edit_admin_campaign_path(campaign), notice: "Image successfully removed."
  end
end