
def poker_hand (hand)
  rank_list = []
  card_ranks = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 11,
                'Q' => 12, 'K' => 13, 'A' => 14 }

  hand_results = {"four of a kind" => false, "three of a kind" => false,
                  "pair" => false, "two pair" => false, "straight" => false,
                  "flush" => false}

  hand.each do |card|
    rank_list.push card_ranks[card[0..-2]]
  end

  rank_list.sort!

  (2..14).each do |rank|
    if rank_list.count(rank) == 2
      if hand_results["pair"]
        hand_results["two pair"] = true
      else
        hand_results["pair"] = true
      end
    elsif rank_list.count(rank) == 3
      hand_results["three of a kind"] = true
    elsif rank_list.count(rank) == 4
      hand_results["four of a kind"] = true
    end
  end

  if  rank_list[0] == rank_list[1] - 1 &&
      rank_list[1] == rank_list[2] - 1 &&
      rank_list[2] == rank_list[3] - 1
      if rank_list[4] == 14 &&
        (rank_list[3] == 13 || rank_list[0] == 2)
          hand_results["straight"] = true
      else
        if (rank_list[3] == rank_list[4] - 1)
          hand_results["straight"] = true
        end
      end
  end

  if  hand[0][-1] == hand[1][-1] &&
      hand[0][-1] == hand[2][-1] &&
      hand[0][-1] == hand[3][-1] &&
      hand[0][-1] == hand[4][-1]

    hand_results["flush"] = true
  end

  result_string = ""

  if hand_results["flush"]
    if hand_results["straight"]
      if rank_list[-1] == 14
        result_string = "royal flush"
      else
        result_string = "straight flush"
      end
    else
      result_string = "flush"
    end
  end

  if hand_results["straight"]
    unless hand_results["flush"]
      result_string = "straight"
    end
  end

  if hand_results["four of a kind"]
    result_string = "four of a kind"
  end

  if hand_results["three of a kind"]
    if hand_results["pair"]
      result_string = "full house"
    else
      result_string = "three of a kind"
    end
  end

  if hand_results["pair"]
    unless hand_results["three of a kind"]
      result_string = "pair"
    end
  end

  if hand_results["two pair"]
    result_string = "two pair"
  end


  if result_string == ""
    if rank_list[-1] == 7
      result_string = "you have a terrible hand"
    else
      result_string = "high card"
    end
  end

  result_string
end
