puts "We're inside this file: #{__FILE__}"

puts "The 'same_level.rb' file on the same level as this file is here: #{File.expand_path('../same_level.rb', __FILE__)}"

puts "The 'up_one_level.rb' file up one level from this file is here: #{File.expand_path('../../up_one_level.rb', __FILE__)}"
