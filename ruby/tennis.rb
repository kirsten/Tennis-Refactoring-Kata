class TennisGame

end
class TennisGame1 < TennisGame

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

  def score
    result = ""
    tempScore=0
    if (points_are_equal?)
      result = {
          0 => "Love-All",
          1 => "Fifteen-All",
          2 => "Thirty-All",
      }.fetch(@p1points, "Deuce")
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
  def points_are_equal?
    @p1points == @p2points
  end
end

class TennisGame2 < TennisGame
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

  def score
    result = ""
    if (@p1points == @p2points and @p1points < 3)
      if (@p1points==0)
        result = "Love"
      end
      if (@p1points==1)
        result = "Fifteen"
      end
      if (@p1points==2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@p1points==@p2points and @p1points>2)
        result = "Deuce"
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
  def initialize(player1Name, player2Name)
    @p1N = player1Name
    @p2N = player2Name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1N
        @p1 += 1
    else
        @p2 += 1
    end
  end

  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if (@p1 == @p2)
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1-@p2)*(@p1-@p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
