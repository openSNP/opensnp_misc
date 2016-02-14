counter = 0

File.open("/tmp/users.txt","w"){ |file|
  User.find_each do |u|
    counter += 1
    file.write("#{counter}\t#{u.created_at}\n")
  end
}
