class UniversitiesController < ApplicationController
  before_action :authenticate_with_token!, except: :index
  before_action :set_university, only: [:show, :update, :destroy]
  
  def index
    @universities = University.all
  end

  def show
  end

  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.json { render :show, status: :created, location: @university }
      else
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

   def update
      respond_to do |format|
         if @university.update(university_params)
            format.json { render :show, status: :ok, location: @university }
         else
            format.json { render json: @university.errors, status: :unprocessable_entity }
         end
      end
      
   end
   
   def destroy
      @university.destroy
         respond_to do |format|
         format.json { head :no_content }
      end
   end

  private

  def set_university
    @university = University.find(params[:id])
  end
  
  def university_params
    params.require(:university).permit(:name, :street, :city, :state, :zip_code)
  end
end
