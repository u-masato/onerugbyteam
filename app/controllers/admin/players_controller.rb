class Admin::PlayersController < Admin::Base

  def new
    @player = Player.new
    # render 'admin/players/new'
  end
  
  def create
    @player = Player.new(safe_player_params)
    if @player.save
      flash[:success] = '選手登録しました'
      redirect_to @player
    else
      flash.now[:dangeser] = '選手登録に失敗しました'
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(safe_player_params)
      flash[:success] = '更新しました'
      redirect_to edit_admin_player_url(@player)
    else
      flash.now[:dangeser] = '更新に失敗しました'
      render :edit
    end
  end
  
  private
  
  def safe_player_params
    params.require(:player).permit(:name, :height, :weight, :position, :birthday, :country_code, :image)
  end
end
