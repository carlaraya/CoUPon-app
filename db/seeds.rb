seeds_list = [
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
