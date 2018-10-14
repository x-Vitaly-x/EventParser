class Api::ImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @image = current_user.images.new(image_params)
    if @image.save
      render('api/images/show', formats: :json)
    else
      render json: @image.errors.full_messages, status: 404
    end
  end

  def index
    @images = current_user.images
    render('api/images/index', formats: :json)
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    render json: {}, status: 200
  end

  private

  def image_params
    params.require(:image).permit(:image_file)
  end
end
