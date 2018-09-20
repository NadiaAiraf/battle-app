require 'sinatra/base'
require 'player'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, 'something secret'

  get '/' do
    erb :player_input
  end

  post '/names' do
    $player_1 = Player.new(params[:player1_name])
    $player_2 = Player.new(params[:player2_name])
    # session[:player1_name] = params[:player1_name]
    redirect '/play'
  end

  get '/play' do
    @player1_name = $player_1.name
    @player2_name = $player_2.name
    # @player2_name = session[:player2_name]
    erb :players
  end

  get '/player_attacked' do
    @player1_name = $player_1.name
    @player2_name = $player_2.name
    erb :attack
  end
end
