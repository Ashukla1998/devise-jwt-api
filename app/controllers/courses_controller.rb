class CoursesController < ApplicationController
  def index
    @courses = Course.all
    render json: CourseSerializer.new(@courses).serializable_hash, status: :ok
  end


  def show
    @course = Course.find_by(id: params[:id])
    if @course.present?
      render json: CourseSerializer.new(@course).serializable_hash, status: :ok
    else
      render json: {error: "not found"}, status: :not_found 
    end
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: CourseSerializer.new(@course).serializable_hash, status: :ok
    else
      render json: {error: "invaloid credentials"}, status: :unprocessable_entity
    end 
  end

  def update
  end

  def destroy
  end
  private 
  def course_params
    params.require(:course).permit(:cname,:code,student_attributes:[:id,:sname,:rollnumber])
  end
end
# per(fff, student_attributes: [:id, :_destroy])