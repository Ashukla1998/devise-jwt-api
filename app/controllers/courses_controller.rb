class CoursesController < ApplicationController
  def index
    @courses = Course.all
    render json: CourseSerializer.new(@courses).serializable_hash, status: :ok
  end


  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
