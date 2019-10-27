class MembersController < ApplicationController
  before_action :require_user_logged_in
  before_action :before_action_params

  def create
    return render 'teams/edit' if @position_number == '-'

    @change_member = @team.members.find_by(position_number: @position_number.to_i)

    if @change_member.present?
      @change_member.player_id = @player_id
      @change_member.save!
    else
      @team.members.find_or_create_by(player_id: @player_id, position_number: @position_number.to_i)
    end
    
    flash[:success] = '選手を登録しました'
    redirect_to edit_team_url(@team)
    
  end
  
  def update
    # same position number
    @active_member = Member.find_by(id: params[:id])
    if @active_member.position_number == @position_number.to_i
      return redirect_to edit_team_url(@team)
    end

    # remove the member from team
    if @position_number == '-'
      @active_member.destroy
      return redirect_to edit_team_url(@team)
    end

    # remove previous member from team
    @change_member = @team.members.find_by(position_number: @position_number.to_i)
    if @change_member.present?
      @change_member.destroy
      @active_member.position_number = @position_number.to_i
      @active_member.save!
    else
      @active_member.position_number = @position_number.to_i
      @active_member.save!
    end

    flash[:success] = '選手を変更しました'
    redirect_to edit_team_url(@team)
    
  end
  
  private 
  
  def before_action_params
    @team = Team.find(params[:member][:team_id])
    @position_number = params[:member][:position_number]
    @player_id = params[:member][:player_id]
    
    if not @team.user_id == current_user.id
      redirect_to current_user
    end
  end
  
end
