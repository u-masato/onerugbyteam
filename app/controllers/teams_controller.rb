class TeamsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :show, :edit, :destroy]
  
  def new
    #@team = Team.new(user_id: current_user.id)
    #binding.pry
  end

  def create
    @team = Team.new(safe_team_params)
    if @team.save
      flash[:success] = 'チームを作成しました'
      redirect_to edit_team_path(@team)
    else
      flash.now[:danger] = 'チームを作成できませんでした'
      render :new
    end
  end

  def show
  end

  def index
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
  end
  
  private
  
  def  safe_team_params
    params.require(:team).permit(:name, :description, :user_id, :first_jersey, :second_jersey)
  end
    
end
