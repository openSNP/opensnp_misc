counter = 0

File.open("/home/app/snpr/public/data/usernumber.csv","w"){ |file|
  User.find_each do |u|
    counter += 1
    file.write("#{counter}\t#{u.created_at}\n")
  end
}
