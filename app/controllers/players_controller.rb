class PlayersController < ApplicationController
  def index
    #return @players if not params[:positon]
    
    if params[:search].blank? && params[:position] == 'ALL'
      return @players =  Player.order(id: :desc).page(params[:page]).per(25)
    end

    # search rugby player with 'name' and 'position'
    # improve searching part of name 
    if params[:position] == 'ALL'
      @players = Player.where(name: params[:search])
    elsif params[:search].blank?
      @players = Player.where(position: params[:position])
    else
      @players = Player.where(name: params[:search], position: params[:position])
    end
  end

  def new
    @player = Player.new
  end
  
  def show
    @player = Player.find(params[:id])
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
  end

  def update
  end
  
  private
  
  def safe_player_params
    params.require(:player).permit(:name, :height, :weight, :position, :birthday, :country_code, :image)
  end
end
