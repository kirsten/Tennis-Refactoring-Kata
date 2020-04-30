class TennisGame
  def initialize(player1Name, player2Name)
      @player1Name = player1Name
      @player2Name = player2Name
      @p1points = 0
      @p2points = 0
    end

  def won_point(playerName)
    if playerName == @player1Name
      @p1points += 1
    else
      @p2points += 1
    end
  end

  def points_are_equal?
    @p1points == @p2points
  end

  def points_are_equal
    {
        0 => "Love-All",
        1 => "Fifteen-All",
        2 => "Thirty-All",
    }.fetch(@p1points, "Deuce")
  end
end

class TennisGame1 < TennisGame
  def score
    result = ""
    tempScore=0
    if (points_are_equal?)
      result = points_are_equal
    elsif (either_player_has_advantage?)
      point_difference = @p1points-@p2points
      if (player1_slight_advantage?(point_difference))
        result ="Advantage player1"
      elsif (player2_slight_advantage?(point_difference))
        result ="Advantage player2"
      elsif (player1_big_advantage?(point_difference))
        result = "Win for player1"
      else (player1_big_advantage?(point_difference))
        result ="Win for player2"
      end
    else
      (1...3).each do |i|
        if (i==1)
          tempScore = @p1points
        else
          result+="-"
          tempScore = @p2points
        end
        result += {
            0 => "Love",
            1 => "Fifteen",
            2 => "Thirty",
            3 => "Forty",
        }[tempScore]
      end
    end
    result
  end

  def player2_big_advantage? point_difference
    point_difference>=-2
  end

  def player1_big_advantage? point_difference
    point_difference>=2
  end

  def player2_slight_advantage? point_difference
    point_difference ==-1
  end

  def player1_slight_advantage? point_difference
    point_difference == 1
  end
  def either_player_has_advantage?
   @p1points>=4 or @p2points>=4
  end
end

class TennisGame2 < TennisGame
  def score
    result = ""
    if (points_are_equal?)
      result = points_are_equal
    end
    p1res = ""
    p2res = ""
    if (@p1points > 0 and @p2points==0)
      if (@p1points==1)
        p1res = "Fifteen"
      end
      if (@p1points==2)
        p1res = "Thirty"
      end
      if (@p1points==3)
        p1res = "Forty"
      end
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@p2points > 0 and @p1points==0)
      if (@p2points==1)
        p2res = "Fifteen"
      end
      if (@p2points==2)
        p2res = "Thirty"
      end
      if (@p2points==3)
        p2res = "Forty"
      end

      p1res = "Love"
      result = p1res + "-" + p2res
    end

    if (@p1points>@p2points and @p1points < 4)
      if (@p1points==2)
        p1res="Thirty"
      end
      if (@p1points==3)
        p1res="Forty"
      end
      if (@p2points==1)
        p2res="Fifteen"
      end
      if (@p2points==2)
        p2res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p2points>@p1points and @p2points < 4)
      if (@p2points==2)
        p2res="Thirty"
      end
      if (@p2points==3)
        p2res="Forty"
      end
      if (@p1points==1)
        p1res="Fifteen"
      end
      if (@p1points==2)
        p1res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p1points > @p2points and @p2points >= 3)
      result = "Advantage " + @player1Name
    end
    if (@p2points > @p1points and @p1points >= 3)
      result = "Advantage " + @player2Name
    end
    if (@p1points>=4 and @p2points>=0 and (@p1points-@p2points)>=2)
      result = "Win for " + @player1Name
    end
    if (@p2points>=4 and @p1points>=0 and (@p2points-@p1points)>=2)
      result = "Win for " + @player2Name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
        p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

  def p1Score
    @p1points +=1
  end

  def p2Score
    @p2points +=1
  end
end

class TennisGame3 < TennisGame
  def score
    if (@p1points < 4 and @p2points < 4) and (@p1points + @p2points < 6)
      pointNames = ["Love", "Fifteen", "Thirty", "Forty"]
      scoreTranslation = pointNames[@p1points]
      @p1points == @p2points ? scoreTranslation + "-All" : scoreTranslation + "-" + pointNames[@p2points]
    else
      if (@p1points == @p2points)
        "Deuce"
      else
        advantagedPlayer = @p1points > @p2points ? @player1Name : @player2Name
        ahead_by_two_points? ? "Win for " + advantagedPlayer : "Advantage " + advantagedPlayer
      end
    end
  end

  def ahead_by_two_points?
    (@p1points-@p2points).abs > 1
  end
end
