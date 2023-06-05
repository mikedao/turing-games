class Admin::CampaignsController < Admin::BaseController
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    campaign = Campaign.create(campaign_params)
    redirect_to admin_campaign_path(campaign)
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    campaign = Campaign.find(params[:id])
    campaign.update(campaign_params)
    redirect_to admin_campaign_path(campaign)
  end

  def destroy
    campaign = Campaign.find(params[:id])
    campaign.destroy
    redirect_to admin_campaigns_path
  end

  private
    def campaign_params
      params.require(:campaign).permit(:title, :description, :image)
    end
end