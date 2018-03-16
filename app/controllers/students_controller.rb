=begin
Students Controller
Copyright (C) 2018 Carl Araya
This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2015-2016
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program. If not, see https://www.gnu.org/licenses/.
**CHANGELOG**
Carl Araya 2/14/18 - Initial creation
Carl Araya 2/14/18 - Add students variable
Carl Araya 2/21/18 - Change students to only org's students


File created on: 2/14/18
Developer: Carl Araya
Client: UP Diliman Department of Computer Science Student Organizations
This software aims to provide a convenient avenue for student organizations to display their org and collect contact information from students interested in joining them.
=end
class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  #def index
  #  @students = Student.all
  #end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @orgs = Org.all
  end

  # GET /students/1/edit
  #def edit
  #end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        StudentMailer.confirm_email(@student).deliver_later

        format.html { redirect_to @student }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    if params[:token]
      @student = Student.find_by_token(params[:token])
      if @student
        @student.token = nil
        if @student.save
          flash[:notice] = "Student confirmed."
        else
          flash[:alert] = "Server error. Please try to fill up the form again."
        end
      else
        flash[:alert] = "Invalid token."
      end
    else
      flash[:alert] = "Invalid token."
    end
    redirect_to root_path
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  #def update
  #  respond_to do |format|
  #    if @student.update(student_params)
  #      format.html { redirect_to @student, notice: 'Student was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @student }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @student.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /students/1
  # DELETE /students/1.json
  #def destroy
  #  @student.destroy
  #  respond_to do |format|
  #    format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:last_name, :first_name, :mi, :year_level, :course, :birthday, :sn, :email, :contact, :org_ids => [])
    end
end
