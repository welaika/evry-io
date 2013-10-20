class StaticController < ApplicationController
  def welcome
    if user_signed_in?
      redirect_to tasks_url
    else
      render 'welcome', layout: 'homepage'
    end
  end

  def logged
  end

  def new
  end

  def list
  end

  def edit
  end
end
