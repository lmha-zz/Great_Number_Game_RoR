class NumbersController < ApplicationController
  def index
    session[:number] ||= rand(1..100)
  end

  def guess
    if(params[:guess].to_i == session[:number])
      message = "#{session[:number]} was the number!"
      flag = "win"
    elsif(params[:guess].to_i < session[:number])
      message = "Too low!"
      flag = "low"
    elsif(params[:guess].to_i > session[:number])
      message = 'Too high!'
      flag = 'high'
    end
    flash[:message] = message
    flash[:flag] = flag
    flash[:guess] = params[:guess]
    redirect_to numbers_path
  end

  def reset
    session[:number] = nil
    redirect_to numbers_path
  end
end