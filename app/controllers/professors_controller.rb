class ProfessorsController < ApplicationController
  before_action :authenticate_with_token!
  before_action :set_professor, only: [:show, :update, :destroy]
  
  def index
    @university = University.find(params[:university_id]) unless params[:university_id].nil?
    @professors = @university.nil? ? Professor.all : @university.professors
  end

  def show
  end

  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.json { render :show, status: :created, location: @professor }
      else
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

   def update
      respond_to do |format|
         if @professor.update(professor_params)
            format.json { render :show, status: :ok, location: @professor }
         else
            format.json { render json: @professor.errors, status: :unprocessable_entity }
         end
      end
      
   end
   
   def destroy
      @professor.destroy
         respond_to do |format|
         format.json { head :no_content }
      end
   end

  private

  def set_professor
    @professor = Professor.find(params[:id])
  end
  
  def professor_params
    params.require(:professor).permit(:name)
  end
end
