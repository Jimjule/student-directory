def input_students
  puts "Please enter the names of the students"
  puts "To finish, just leave the answers blank"
  students = []
  name = gets.chop
  while !name.empty? do
    students << {name: name, cohort: :november}
    if students.length == 1
      puts "Now we have #{students.count} student"
      else
      puts "Now we have #{students.count} students"
    end
    name = gets.rstrip
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
    puts "#{students[i][:name]} #{students[i][:cohort]} cohort"
    i += 1
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end


print_header
print(students)
print_footer(students)
