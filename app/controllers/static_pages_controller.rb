class StaticPagesController < ApplicationController
  def home
    @location = Location.new(params[:location]) if logged_in?
    # @location = current_user.locations.build if logged_in?
  end

  def help
  end

  def about
  end
end
