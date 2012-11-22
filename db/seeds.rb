# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'CREATING ROLES'
puts "------------------------------------"
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' }, 
  { :name => 'developer' }
], :without_protection => true)
puts "Roles created: :admin, :user, :developer"

puts 'SETTING UP USERS (9)'

puts "------------------------------------"
puts "Creating PARIS users:"
puts "------------------------------------"
# Paris Administrator
padmin = User.create! :name => 'Paris Administrator', :email => 'padmin@foo.com', :password => 'foobar', :password_confirmation => 'foobar'
puts 'New Admin created: '     << padmin.name

# Paris User
puser = User.create!  :name => 'Paris User',          :email => 'paris@foo.com',  :password => 'foobar', :password_confirmation => 'foobar'
puts 'New User created: '      << puser.name

# Paris Developer
pdev = User.create!  :name => 'Paris Developer',      :email => 'pdev@foo.com',   :password => 'foobar', :password_confirmation => 'foobar'
puts 'New Developer created: ' << pdev.name

# Paris assign roles
padmin.add_role :admin
puser.add_role  :user
pdev.add_role   :developer


puts "------------------------------------"
puts "Creating ANDREAS users:"
puts "------------------------------------"
# Andreas Administrator
aadmin = User.create! :name => 'Andreas Administrator', :email => 'aadmin@foo.com',  :password => 'foobar', :password_confirmation => 'foobar'
puts 'New Admin created: '     << aadmin.name

# Andreas User
auser = User.create!  :name => 'Andreas User',          :email => 'andreas@foo.com', :password => 'foobar', :password_confirmation => 'foobar'
puts 'New User created: '      << auser.name

# Andreas Developer
adev = User.create!  :name => 'Andreas Developer',      :email => 'adev@foo.com',    :password => 'foobar', :password_confirmation => 'foobar'
puts 'New Developer created: ' << adev.name

# Andreas assign roles
aadmin.add_role :admin
auser.add_role  :user
adev.add_role   :developer


puts "------------------------------------"
puts "Creating VASILEIOS users:"
puts "------------------------------------"
# Vasileios Administrator
vadmin = User.create! :name => 'Vasileios Administrator', :email => 'vadmin@foo.com',    :password => 'foobar', :password_confirmation => 'foobar'
puts 'New Admin created: '     << vadmin.name

# Vasileios User
vuser = User.create!  :name => 'Vasileios User',          :email => 'vasileios@foo.com', :password => 'foobar', :password_confirmation => 'foobar'
puts 'New User created: '      << vuser.name

# Vasileios Developer
vdev = User.create!  :name => 'Vasileios Developer',      :email => 'vdev@foo.com',      :password => 'foobar', :password_confirmation => 'foobar'
puts 'New Developer created: ' << vdev.name

# Vasileios assign roles
vadmin.add_role :admin
vuser.add_role  :user
vdev.add_role   :developer