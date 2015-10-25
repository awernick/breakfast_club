class CoursesController < ApplicationController
#  before_action :authenticate_with_token!
  before_action :set_course, only: [:show, :update, :destroy]
  
  def index
    @courses = Course.all
  end

  def show
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.json { render :show, status: :created, location: @course }
      else
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

   def update
      respond_to do |format|
         if @course.update(course_params)
            format.json { render :show, status: :ok, location: @course }
         else
            format.json { render json: @course.errors, status: :unprocessable_entity }
         end
      end
      
   end
   
   def destroy
      @course.destroy
         respond_to do |format|
         format.json { head :no_content }
      end
   end

  private

  def set_course
    @course = Course.find(params[:id])
  end
  
  def course_params
    params.require(:course).permit(:name, :uid, :university_id, :professor_id) 
  end
end
