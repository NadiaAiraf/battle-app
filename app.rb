require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, 'something secret'

  get '/' do
    erb :player_input
  end

  post '/names' do
    $player_1 = Player.new(params[:player1_name])
    $player_2 = Player.new(params[:player2_name])
    $game = Game.new($player_1,$player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :players
  end

  post '/play' do
    $game.attack($game.player1)
    $game.turn_switcher
    redirect '/game-over' if $game.winner?
    redirect '/play'
  end

  get '/player_attacked' do
    $game.attack($game.player2)
    $game.turn_switcher
    @game = $game
    redirect '/game-over' if $game.winner?
    erb :attack
  end

  get '/game-over' do
    @game = $game
    erb :game_over
  end
end
