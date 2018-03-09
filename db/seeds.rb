=begin
Test Seeds
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

File created on: 2/07/18
Developer: Carl Araya
Client: UP Diliman Department of Computer Science Student Organizations
This software aims to provide a convenient avenue for student organizations to display their org and collect contact information from students interested in joining them.
=end
seeds_list = [
  {
    model: Admin,
    seeds: [
      { email: "one@admin.com", password: "password", password_confirmation: "password" },
      { email: "two@admin.com", password: "password", password_confirmation: "password" },
    ]
  },
  {
    model: Org,
    seeds: [
      { name: "UP CSI", email: "asdf@asdf.com", password: "asdfasdf", password_confirmation: "asdfasdf" },
      { name: "UP ACM", email: "qwer@qwer.com", password: "qwerqwer", password_confirmation: "qwerqwer" },
    ]
  }
]

seeds_list.reverse.each do |seed_obj|
  seed_obj[:model].destroy_all
end
seeds_list.each do |seed_obj|
  print "Adding seeds to ", seed_obj[:model].name, "..."
  hmm = seed_obj[:model].create(seed_obj[:seeds])
  hmm.each do |hm|
    if hm.errors.messages.length > 0
      puts hm.errors.inspect
    end
  end
  puts "Done."
end
puts "Finished adding seeds lmao"

ActiveRecord::Base.connection.tables.each { |t| ActiveRecord::Base.connection.reset_pk_sequence!(t) }
