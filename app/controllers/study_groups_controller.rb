class StudyGroupsController < ApplicationController
  before_action :set_study_group, only: [:show, :update, :destroy]
  
  def index
    @study_groups = StudyGroup.all
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

  private

  def set_study_group
    @study_group = StudyGroup.find(params[:id])
  end
  
  def study_group_params
    params.require(:study_group).permit(:name, :course_id, :description, :active, :latitude, :longitude)
  end
end
