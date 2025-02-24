
class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    url = "https://dictionary.lewagon.com/"
    @answer = params[:answer]
    @token = params[:token]
    intersection = @answer.chars & @token.chars == @answer.chars
    if intersection == false
      @show = "#{@answer} doesn't appear to contain the letters in #{@token.chars}"
    else
      @dictionary = JSON.parse RestClient.get(url + @answer)
      if @dictionary["found"]
        @show = "Congrats you got #{@dictionary["length"]}# points with your word"
      else
        @show = "Not and english word!"
      end
    end
  end
end
