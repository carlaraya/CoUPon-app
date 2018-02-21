=begin
Create Students Migration
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

File created on: 2/14/18
Developer: Carl Araya
Client: UP Diliman Department of Computer Science Student Organizations
This software aims to provide a convenient avenue for student organizations to display their org and collect contact information from students interested in joining them.
=end
class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.string :mi
      t.integer :year_level
      t.string :course
      t.date :birthday
      t.string :sn
      t.string :email
      t.string :contact

      t.timestamps
    end
  end
end
