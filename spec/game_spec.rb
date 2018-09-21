require 'game'

describe Game do
  let(:pokemon) { described_class.new(tom, andy) }
  let(:tom) {double :player, reduce_hp: nil, hit_points: 20 }
  let(:andy) { double :player2, reduce_hp: nil, hit_points: 20 }

  let(:digimon) { described_class.new(loser, winner)}
  let(:loser) { double :player, hit_points: 0 }
  let(:winner) { double :player, hit_points: 20 }

  describe 'player1' do
    it 'should return the player1 object' do
      expect(pokemon.player1).to eq tom
    end
  end

  describe 'player2' do
    it 'should return the player2 object' do
      expect(pokemon.player2).to eq andy
    end
  end

  describe '#attack' do
    it 'reduces another players hp by 10' do
      pokemon.attack(andy)
      expect(andy).to have_received(:reduce_hp)
    end
    it 'reduces another players hp by 10' do
      pokemon.attack(tom)
      expect(tom).to have_received(:reduce_hp)
    end
  end

  describe '#turn_switcher' do
    it 'switches players from player 1 to player 2' do
      pokemon.turn_switcher
      expect(pokemon.turn).to eq andy
    end
    it 'switches players from player 1 to player 2 back to player 1' do
      pokemon.turn_switcher
      pokemon.turn_switcher
      expect(pokemon.turn).to eq tom
    end
  end

  describe '#winner?' do
    it 'returns true that a player has won if opponents HP 0 or lower' do
      expect(digimon.winner?).to eq true
    end
    it 'returns false if no player has less than or equal to 0 HP' do
      expect(pokemon.winner?).to eq false
    end
  end

  describe '#winner' do
    it 'returns player 2 if player 1s hp is 0 or less' do
      expect(digimon.winner).to eq winner
    end
  end
end
