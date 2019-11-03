class TeamsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :destroy]
  before_action :require_team_owner, only: [:edit, :destroy]

  def index
    @teams = Team.order(id: :desc).page(params[:page]).per(8)
  end

  def new
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
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(safe_team_params)
      flash[:success] = 'チームを更新しました'
      redirect_to @team
    else
      flash.now[:danger] = 'チームを更新できませんでした'
      render 'teams/edit'
    end
  end
  
  private
  
  def  safe_team_params
    params.require(:team).permit(:name, :description, :user_id, :first_jersey, :second_jersey)
  end
  
  def require_team_owner
    @team = Team.find(params[:id])
    if not @team.user_id == current_user.id
      redirect_to current_user
    end
  end
    
end
