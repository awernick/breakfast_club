class StudyGroupsController < ApplicationController
  before_action :authenticate_with_token!
  before_action :set_study_group, only: [:show, :update, :destroy, :join, :leave]
  
  def index
    @course = Course.find(params[:course_id]) unless params[:course_id].nil? 
    @study_groups = @course.nil? ? StudyGroup.all : @course.study_groups
  end

  def show
  end

  def create
    @study_group = StudyGroup.new(study_group_params)

    respond_to do |format|
      if @study_group.save
        format.json { render :show, status: :created, location: @study_group }
      else
        format.json { render json: @study_group.errors, status: :unprocessable_entity }
      end
    end
  end

   def update
      respond_to do |format|
         if @study_group.update(study_group_params)
            format.json { render :show, status: :ok, location: @study_group }
         else
            format.json { render json: @study_group.errors, status: :unprocessable_entity }
         end
      end
   end
   
   def destroy
     @study_group.destroy
      respond_to do |format|
      format.json { head :no_content }
     end
   end

  def join
    @current_user = User.find(params[:user_id])
    @attendance = Attendance.new(user_id: @current_user, study_group_id: @study_group )
    respond_to do |format|
      if @attendance.save
        format.json { render json: {status: 'joined'}, status: :okay }
      else
        format.json { render json: @study_group.errors, status: :unprocessable_entity }
      end
    end
  end


  def leave
    @attendance = @study_group.attendances.find_by(user_id: params[:user_id])
    respond_to do |format|
      if @attendance.destroy
        format.json { render json: {status: 'left'}, status: :okay }
      else
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_study_group
    @study_group = StudyGroup.find(params[:id])
  end
  
  def study_group_params
    params.require(:study_group).permit(:name, :course_id, :description, :active, :latitude, :longitude)
  end
end
