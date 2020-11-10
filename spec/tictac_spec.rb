require_relative '../lib/game_board.rb'
require_relative '../lib/game_player.rb'
require_relative '../lib/game.rb'

describe Board do
  let(:game_b) { Board.new }
  let(:player1) { Player.new('Lorem', 'X', :red) }
  let(:player2) { Player.new('Ipsum', 'O', :blue) }
  let(:current_player) { player1 }

  describe '#valid_move?' do
    it 'returns true if the argument passed is between 1, 9' do
      expect(game_b.valid_move?(1)).to eql(true)
    end
  end

  describe '#position_taken?' do
    it 'returns true if the position_taken' do
      game_b.board = ['X', 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game_b.position_taken?(1)).to eql(true)
    end
  end

  describe '#update' do
    it 'returns the element that has been updated on the board' do
      expect(game_b.update(2, player1)).to eql('X'.colorize(:red))
    end
  end

  describe '#switch_player' do
    it 'switches the player turn and returns the current_player player' do
      expect(game_b.switch_player(player1, player2, current_player)).to eql(player2)
    end
  end

  describe '#win?' do
    it 'returns true if there is a winning combination' do
      game_b.board = ['X'.colorize(:red), 'X'.colorize(:red), 'X'.colorize(:red), 4, 5, 6, 7, 8, 9]
      expect(game_b.win?).to eql(true)
    end
  end

  describe 'tied?' do
    it 'returns true if all the places have been taken and nobody has won' do
      game_b.board = %w[X X O
                        O X X
                        X O O]
      expect(game_b.tied?).to eql(true)
    end
  end
end

describe Player do
  let(:player) { Player.new('Lorem', 'X', :red) }
  it 'initializes a player with the name as first argument, character as second and color as third' do
    expect(player.name).to eql('Lorem'.red)
  end
end

describe Game do
  let(:game) { Game.new }
  let(:game_b) { Board.new }
  let(:player1) { Player.new('Lorem', 'X', :red) }
  let(:player2) { Player.new('Ipsum', 'O', :blue) }
  let(:current_player) { player1 }

  describe '#valid_name?' do
    it 'Checks whether the name meets the required conditions andn returns the name' do
      expect(game.valid_name?('Lorem')).to eql('Lorem')
    end
  end

  describe '#validate_input' do
    it 'Returns the position if it is valid' do
      expect(game.validate_input(game_b, 9)).to eql(9)
    end
  end
end
