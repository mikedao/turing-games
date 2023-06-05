class Admin::CharactersController < Admin::BaseController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      redirect_to admin_character_path(@character), :notice  => "Successfully updated character." 
    else
      flash[:error] = @character.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    character = Character.find(params[:id])
    character.destroy
    redirect_to admin_characters_path, :notice => "Successfully destroyed character."
  end

  private
    def character_params
      params.require(:character).permit(:name, :image_url, :background)
    end
end