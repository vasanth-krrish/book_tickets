class ScreensController < ApplicationController
  def new
    @theatre = Theatre.find(params[:theatre_id])
    @screen = @theatre.screens.build
    respond_to do |f|
      f.js
    end
  end

  def create
    @theatre = Theatre.find(params[:theatre_id])
    @screen = @theatre.screens.build(screen_params)
    begin
      @screen.save
    rescue ActiveRecord::RecordNotUnique
      @error = "#{@screen.name} already exists"
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    @screen = Screen.find(params[:id])
    begin
      @screen.update(screen_params)
    rescue ActiveRecord::RecordNotUnique
      @error = "#{@screen.name} already exists"
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @theatre = Theatre.find(params[:theatre_id])
    @screen = Screen.find(params[:id])
  end

  def edit
    @screen = Screen.find(params[:id])
  end

  def destroy
    @screen = Screen.find(params[:id])
    begin
      @screen.destroy
    rescue
      @error = "#{@screen.name} can not be deleted as it is used already"
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def screen_params
    params.require(:screen).permit(:name, :seats, :price_cents)
  end
end
