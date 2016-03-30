class LocationsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @location = current_user.locations.build(location_params)
    respond_to do |format|
      if @location.save
        format.html { redirect_to(current_user, :notice => 'Location was successfully created.') }
        format.xml  { render :xml => @location, :status => :created, :location => @location }

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
        render 'static_pages/home'
      end
    end
  end

  def destroy
    @location = current_user.locations.find_by(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(request.referrer || root_url) }
      format.xml  { head :ok }
    end

  end

  private
    def location_params
      params.require(:location).permit(:name, :address)
    end

    def correct_user
      @location = current_user.locations.find_by(id: params[:id])
      redirect_to root_url if @location.nil?
    end
end
