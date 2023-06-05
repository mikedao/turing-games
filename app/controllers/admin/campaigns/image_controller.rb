class Admin::Campaigns::ImageController < Admin::BaseController
  include ActionView::RecordIdentifier

  def destroy
    campaign = Campaign.find(params[:campaign_id])
    campaign.image.purge_later

    respond_to do |format|
      format.html { redirect_to edit_admin_campaign_path(campaign), notice: "Image successfully removed." }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(campaign, :image)) }
    end
  end
end