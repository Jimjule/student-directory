def input_students
  puts "Please enter the names of the students"
  puts "To finish, just leave the answers blank"
  students = []
  name = gets.chomp
  puts "Where are they from?"
  country = gets.chomp
  puts "What's their hobby?"
  hobby = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, country: country, hobby: hobby}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the student"
    name = gets.chomp
    puts "Where are they from?"
    country = gets.chomp
    puts "What's their hobby?"
    hobby = gets.chomp
  end
  students
end

students = input_students

def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(students)
  i = 0
  while i < students.length
    puts "#{students[i][:name]}".center(3), + "#{students[i][:cohort]}".center(5) + " cohort, from #{students[i][:country]}".center(7) + " and #{students[i][:hobby]} as their hobby"
    i += 1
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end


print_header
print(students)
print_footer(students)
