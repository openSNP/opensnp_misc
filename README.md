# opensnp_misc
A collection of secondary scripts for openSNP stuff (plotting etc.)

# Plotting scripts
The plots assume txt files with genotypes/users/phenotypes of this format:

User.id\tUser.created_at\n

So for example this minimal script creates the needed users.txt in Ruby on Rails:

File.open("users.txt", "w"){ |file|
    User.find_each do |u|
        file.write("#{u.id}\t#{u.created_at}\n")
    end
}

