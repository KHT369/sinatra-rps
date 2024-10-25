require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:home)
end

def random 
  rps = ["rock", "paper", "scissors"]
  rps.sample
end

get("/rock") do
  def roll(ai_choice)
    if ai_choice == "paper"
      pp "We lost!"
    elsif ai_choice == "rock"
      pp "We tied!"
    else
      pp "We won!"
    end
  end
  
  ai_choice = random

  @outcome = "We played rock!\nThey played #{ai_choice}!\n #{roll(ai_choice)}"

  erb(:rock)
end

get("/paper") do
  def roll(ai_choice)
    if ai_choice == "scissors"
      pp "We lost!"
    elsif ai_choice == "paper"
      pp "We tied!"
    else
      pp "We won!"
    end
  end
  
  ai_choice = random

  @outcome = "We played paper!\nThey played #{ai_choice}!\n #{roll(ai_choice)}"

  erb(:paper)
end

get("/scissors") do
  def roll(ai_choice)
    if ai_choice == "scissors"
      pp "We tied!"
    elsif ai_choice == "paper"
      pp "We won!"
    else
      pp "We lost!"
    end
  end
  
  ai_choice = random

  @outcome = "We played scissors!\nThey played #{ai_choice}!\n #{roll(ai_choice)}"

  erb(:scissors)
end
