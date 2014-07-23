require('rspec')
require('poker_hand')

describe("poker_hand") do
  it("returns 'flush' for five cards with the same suit") do
    poker_hand(["2H", "4H", "6H", "8H", "10H"]).should(eq("flush"))
  end

  it("returns 'straight' for five cards with consecutive rank") do
    poker_hand(["10H", "JS", "QC", "KD", "AH"]).should(eq("straight"))
  end

  it("returns 'straight flush' for five cards with consecutive ranks and the same suit") do
    poker_hand(["2H", "3H", "4H", "5H", "6H"]).should(eq("straight flush"))
  end

  it("returns 'straight' for five cards with consecutive ranks, starting with A") do
    poker_hand(["AH", "2D", "3C", "4D", "5H"]).should(eq("straight"))
  end

  it("returns 'four of a kind' if there are four of the same rank card") do
    poker_hand(["4H", "4D", "4C", "4S", "6D"]).should(eq("four of a kind"))
  end

  it("returns 'three of a kind' if there are three of the same rank card") do
    poker_hand(["4H", "4D", "4C", "5S", "6D"]).should(eq("three of a kind"))
  end

  it("returns 'pair' if there are two and only two of the same rank card") do
    poker_hand(["4H", "4D", "6C", "9S", "8D"]).should(eq("pair"))
  end

  it("returns 'two pair' if there are two pairs") do
    poker_hand(["4H", "4D", "5C", "5S", "6D"]).should(eq("two pair"))
  end

  it("returns 'full house' if there is a three of a kind and a pair") do
    poker_hand(["4H", "4D", "5C", "5S", "5D"]).should(eq("full house"))
  end

  it("returns 'royal flush' if there is a flush to an ace") do
    poker_hand(["AH", "KH", "QH", "JH", "10H"]).should(eq("royal flush"))
  end

  it("says 'you have a terrible hand' for the worst hand possible") do
    poker_hand(["2H", "3D", "4C", "5S", "7D"]).should(eq("you have a terrible hand"))
  end
end

