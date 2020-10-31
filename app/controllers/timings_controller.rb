class TimingsController < ApplicationController
  def index
    @screen = Screen.find(params[:screen_id])
  end

  def new
    @screen = Screen.find(params[:screen_id])
    @timing = Timing.new
  end

  def create
    @screen = Screen.find(params[:screen_id])
    @timing = Timing.new(timing_params)
    if @timing.save
      @error = nil
    else
      @error = "Timing already exists."
    end
  end

  def edit
    @screen = Screen.find(params[:screen_id])
    @timing = Timing.find(params[:id])
  end

  def update
    @timing = Timing.find(params[:id])
    if @timing.update(timing_params)
      @error = nil
    else
      @error = "Timing already exists."
    end
  end

  def destroy
    @timing = Timing.find(params[:id])
    if @timing.destroy
      @error = nil
    else
      @error = "Timing already exists."
    end
  end

  private

  def timing_params
    params.require(:timing).permit(:screen_id, :timing)
  end
end
