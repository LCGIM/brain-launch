class StudentsController < ApplicationController
  def show; end


  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.user_id = current_user.id
    if @student.save
      redirect_to accounts_path, notice: "New Student Created"
    else
      redirect_to :back, notice: "Sorry. There was an error."
    end
  end

  def edit
  end

  def destroy
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

end
