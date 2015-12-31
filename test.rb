ENV['RACK_ENV'] = 'test'
require './TicTacToe_Frontend'
require 'minitest/autorun'
require 'rack/test'
require 'tilt/erb'
#require_relative 'app.rb'


class MyTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  

  def test_for_index_erb
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('slideshowimages("mm.png","rules2.png.gif","board.png")')
    assert last_response.body.include?('slideshowlinks("/minedminds","/rules","/playgame")')
  end

  def test_it_redirects_to_rules_erb
    get '/rules'
    assert last_response.ok?
    assert last_response.body.include?('"https://en.wikipedia.org/wiki/Tic-tac-toe#Strategy"><center><IMG SRC="rules2.png.gif" ')
    assert last_response.body.include?('"https://en.wikipedia.org/wiki/Tic-tac-toe#Strategy"')
    assert last_response.body.include?('Learn how to play a perfect Tic Tac Toe game, Click on The Icon Above!!')
    assert_equal "http://example.org/rules",last_request.url
  end

  
  def test_it_redirects_to_playgame_erb
    get '/playgame'
    assert last_response.ok?
    assert_equal "http://example.org/playgame",last_request.url
    assert last_response.body.include?('"/tictactoe"><center><IMG SRC="board.png" ALT="Play Game"')
    assert last_response.body.include?('IMG SRC="board.png"')
  end

  def test_it_redirects_to_minedminds_erb
    get '/minedminds'
    assert last_response.ok?
    assert_equal "http://example.org/minedminds",last_request.url
    assert last_response.body.include?('"http://www.minedminds.org"><center><IMG SRC="mm.png" ALT="Mined Minds"')
    assert last_response.body.include?('"https://www.facebook.com/MinedMinds"')
    #assert_equal '"https://www.facebook.com/MinedMinds"', last_response.body
  end

  def test_for_pictures1
    get '/minedminds'
    pictures = load_pictures
    assert pictures.length > 0, "There are no pictures" #message displayed when assertion is false
  end
  
  def test_for_pictures2
    get '/playgame'
    pictures = load_pictures
    assert pictures.length > 0, "There are no pictures" #message displayed when assertion is false 
  end

  def test_for_pictures3
    get '/rules'
    pictures = load_pictures
    assert pictures.length > 0, "There are no pictures" #message displayed when assertion is false 
  end

  def test_for_pictures4
    get '/index'
    pictures = load_pictures
    assert pictures.length > 0, "There are no pictures" #message displayed when assertion is false 
  end

  def test_for_home_index
    get '/'
    assert last_response.ok?
    assert last_response.body.include?("mm.png")
  end


end

class NotFound < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  def test_it_is_a_404 #does root exist??
    get '/starter_page'
    assert_equal 404, last_response.status
  end

end 







