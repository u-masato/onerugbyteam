class MembersController < ApplicationController
  before_action :require_user_logged_in
  before_action :active_member_and_change_player

  def create

    if @position_number == '-'
      return render 'teams/edit'
    end
    
    # binding.pry
    if @team.players?(@change_player)
      @team.update_member(@change_player, @position_number)
      return redirect_to edit_team_url(@team)
    end

    if @change_player.present? && @active_member.present?
      @active_member.destroy
    end

    if @change_player.present?
      @team.add_member(@change_player, @position_number)
      flash[:success] = '選手を登録しました'
    end

    redirect_to edit_team_url(@team)
    
  end
  
  def update

    if @position_number == '-' && @change_player.present?
      @team.remove_member(@change_player)
      return redirect_to edit_team_url(@team)
    end

    if @change_player.present? && @active_member.present?
      @active_member.destroy
    end

    if @change_player.present?
      @team.update_member(@change_player, @position_number)
      flash[:success] = '選手を変更しました'
    end

    redirect_to edit_team_url(@team)
  end
  
  private 
  
  def active_member_and_change_player
    @team = Team.find(params[:member][:id])
    @position_number = params[:member][:position_number]
    @active_member = @team.members.find_by(position_number: @position_number)
    @change_player = Player.find_by(id: params[:member][:player_id])
  end
  
end
