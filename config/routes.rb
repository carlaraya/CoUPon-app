=begin
Routes Configuration
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
Carl Araya 2/14/18 - Add routes for students
Carl Araya 3/16/18 - Add routes for confirmation

File created on: 2/07/18
Developer: Carl Araya
Client: UP Diliman Department of Computer Science Student Organizations
This software aims to provide a convenient avenue for student organizations to display their org and collect contact information from students interested in joining them.
=end

Rails.application.routes.draw do
  root to: 'home#index'
  get 'about', to: 'home#about'

  resources :students, only: [:create, :show]
  get 'apply', to: 'students#new'
  get 'student_confirm', to: 'students#confirm'

  devise_for :orgs
  get 'manage', to: 'manage#index'
  get 'manage/table', to: 'manage#table'
  get 'manage/edit', to: 'manage#edit'
  patch 'manage/update', to: 'manage#update'
  delete 'manage/destroy', to: 'manage#destroy'

  devise_for :admins
  get 'admins', to: 'admins#index'
  post 'create_org', to: 'admins#create_org'

end
