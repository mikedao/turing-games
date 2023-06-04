class CharactersController < ApplicationController
  # def index
  #   @characters = Character.all
  # end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.campaign_id = params[:campaign_id]
    @character.user_id = current_user.id
    if @character.save
      redirect_to campaign_character_path(params[:campaign_id], @character), :notice => "Successfully created character."
    else
      flash[:error] = @character.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    if @character.update_attributes(params[:character])
      redirect_to @character, :notice  => "Successfully updated character."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_url, :notice => "Successfully destroyed character."
  end

  private
    def character_params
      params.require(:character).permit(:name, :image_url, :background)
    end
end