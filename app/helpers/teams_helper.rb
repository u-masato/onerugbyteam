module TeamsHelper

  def average_of_forward_weight
    sum_weight = 0
    num = 0

    @team.members.each do |member|
      if member.position_number && member.position_number.between?(1, 8)
        sum_weight += member.player.weight 
        num += 1
      end
    end
    
    return 0 if num == 0

    sum_weight / num
  end

  def average_of_height
    sum_height = 0
    num = 0
    @team.members.each do |member|
      if member.player 
        sum_height += member.player.height
        num += 1
      end
    end
    
    return 0 if num == 0
    
    sum_height / num
  end

end
