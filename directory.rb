# First, we make an array of students
students = [
  {name: "Hannibal Lector", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]
# And then print them
def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]}, (#{student[:cohort]}) cohort"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
