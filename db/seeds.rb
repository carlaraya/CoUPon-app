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
      { name: "UP CSI", email: "csi@csi.com", password: "password", password_confirmation: "password", info: "The UP Center for Student Innovations is a service-oriented organization aimed towards the enhancement of student learning from the University of the Philippines Diliman, Department of Computer Science by working with real-world projects. The organization commits itself to promote the innovative culture by producing quality software geared towards innovation and service.", contact: "dcs.innovate@up-csi.com\nup-csi.com" },
      { name: "UP ACM", email: "acm@acm.com", password: "password", password_confirmation: "password", info: "The Association for Computing Machinery - University of the Philippines Student Chapter (UP ACM) is the first local student chapter of the largest scientific and educational international computing society, the Association for Computing Machinery, and remains as Manila’s premiere student organization for computing. We support our members in the pursuit of academic excellence, leading to a regular batch of honors graduates from the organization every year.\n\nBeyond the academe, UP ACM's larger mission is the pursuit of modern community development. With ACM International's objective of forwarding computing as a science and profession, UP ACM takes it a step forward by framing computer science as a vehicle for community development, especially for the less technologically advanced communities of Metro Manila.\n\nUP ACM connects people and ideas by delivering top quality lectures, workshops, and competitions to schools and universities across Metro Manila. With annual projects for each academic levels - from elementary to the graduate level - UP ACM is leading the way in forwarding computer science and technology in the pursuit of our common goal - to the develop the communities of our future.", contact: "council@upacm.net\nupacm.net" },
      { name: "UP Parser", email: "parser@parser.com", password: "password", password_confirmation: "password", info: "The UP Parser is the College of Engineering's first and foremost department-based publication. Carrying the motto \"Analyzing Life the CS Way\", Parser aims to be the voice of the Department of Computer Science (DCS), a mediator between the department and student body, as well as an outlet for skilled programmer-journalists.", contact: "dcsupparser@gmail.com\ntheupparser.wordpress.com" },
      { name: "DCS Servers", email: "servers@servers.com", password: "password", password_confirmation: "password", info: "The DCS Servers is the official volunteer corps of the Department of Computer Science. They organize the events of the Department and cater to the needs of the Computer Science students. They also serve as an intermediary between the students and the Department's faculty. They work hand-in-hand with the Computer Science Representatives to the Engineering Student Council.", contact: "N/A" },
      { name: "UP CURSOR", email: "cursor@cursor.com", password: "password", password_confirmation: "password", info: "The UP Association of Computer Science Majors (UP CURSOR) is a nonsectarian, nonprofit, and socio-academic organization founded on August 16, 1983 by a group of BS Computer Science students. The following are the objectives of the Organization:\n\n1. To extend the training of its members beyond the formal limits of the Bachelor of Science in Computer Science curriculum of the University of the Philippines Diliman;\n2. To integrate the efforts of its members in pursuit of academic growth and excellence;\n3. To foster goodwill, friendship, cooperation, and dedication among its members;\n4. To cultivate and maintain cordial, fraternal, and professional relations with other organizations inside and outside the University; and\n5. To provide a channel for the promotion of general interests in the field of computer science. These are achieved by utilizing the talents and skills of its members to hold different events where different topics in computer science are discussed. The organization also provides different services for its members and the Department of Computer Science – UP Diliman. This way it can can develop its members holistically while promoting computer science and what it can offer to the society.", contact: "execomm.upcursor@gmail.com" },
    ]
  }
]

seeds_list.reverse.each do |seed_obj|
  seed_obj[:model].destroy_all
end

ActiveRecord::Base.connection.tables.each { |t| ActiveRecord::Base.connection.reset_pk_sequence!(t) }

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

