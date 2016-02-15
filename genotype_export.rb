counter = 0

File.open("/home/app/snpr/public/data/genotypenumber.csv","w"){ |file|
  Genotype.find_each do |u|
    counter += 1
    file.write("#{counter}\t#{u.created_at}\n")
  end
}
