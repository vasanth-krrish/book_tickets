class TheatresController < ApplicationController
  before_action :set_theatre, only: [:show, :edit, :update, :destroy]

  def index
    @theatres = Theatre.all
  end

  def new
    @theatre = Theatre.new
  end

  def create
    @theatre = Theatre.new(theatre_params)

    respond_to do |format|
      if @theatre.save
        format.html { redirect_to @theatre, notice: 'Theatre was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @theatre.update(theatre_params)
        format.html { redirect_to @theatre, notice: 'Theatre was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @theatre.destroy
    respond_to do |format|
      format.html { redirect_to theatres_url, notice: 'Theatre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_theatre
      @theatre = Theatre.find(params[:id])
    end

  def theatre_params
    params.require(:theatre).permit(:name, :address, :city, :state, :pincode, :image)
  end
end
