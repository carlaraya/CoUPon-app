=begin
Org Model
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
Carl Araya 2/07/18 - Initial creation
Carl Araya 2/21/18 - Add student connection

File created on: 2/07/18
Developer: Carl Araya
Client: UP Diliman Department of Computer Science Student Organizations
This software aims to provide a convenient avenue for student organizations to display their org and collect contact information from students interested in joining them.
=end

class Org < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, length: { minimum: 2 }
  validates_uniqueness_of :name, case_sensitive: false

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :students

  has_one_attached :logo
  validates :logo, file_size: { less_than_or_equal_to: 1.megabyte },
        file_content_type: { allow: ['image/png'] }
  def logo_medium
    self.logo.variant(resize: "300x300^", combine_options: {gravity: "center", extent: "300x300"})
  end
  def logo_thumb
    self.logo.variant(resize: "100x100^", combine_options: {gravity: "center", extent: "100x100"})
  end
  #has_attached_file :logo,
    #styles: { medium: "300x300>", thumb: "100x100>" },
    #convert_options: { medium: "-gravity center -extent 300x300", thumb: "-gravity center -extent 100x100"},
    #default_url: "/images/missing_:style.png"
  #validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  #validates_with AttachmentSizeValidator, attributes: :logo, less_than: 1.megabytes
  
end
