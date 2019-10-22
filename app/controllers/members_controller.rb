class MembersController < ApplicationController
  before_action :require_user_logged_in

  def create

    @team = Team.find(params[:member][:id])

    player =Player.find_by(id: params[:member][:player_id])
    
    position_number = params[:member][:position_number]
    if position_number == '-'
      return render 'teams/edit'
    end

    active_player = @team.players.find_by(id: position_number)
    if active_player
      @team.remove_member(active_player)
    end
    
    @team.add_member(player, position_number)

    flash[:success] = '選手を登録しました'
    redirect_to edit_team_url(@team)
    
  end

  def destroy
  end
end
