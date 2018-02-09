# DB Schema
# Copyright (C) 2018 Carl Araya
# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2015-2016
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see https://www.gnu.org/licenses/.
# **CHANGELOG**
# Carl Araya 2/07/18 - Initial creation
# 
# File created on: 2/07/18
# Developer: Carl Araya
# Client: UP Diliman Department of Computer Science Student Organizations
# This software aims to provide a convenient avenue for student organizations to display their org and collect contact information from students interested in joining them.



ActiveRecord::Schema.define(version: 20180207025504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orgs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_orgs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_orgs_on_reset_password_token", unique: true
  end

end
