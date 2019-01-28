# First, we make an array of students
students = [
  ["Hannibal Lector", :november],
  ["Darth Vader", :november],
  ["Michael Corleone", :november],
  ["Terminator", :november],
  ["The Joker", :november],
  ["Norman Bates", :november]
]
# And then print them
def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(students)
  students.each do |student|
    puts "#{student[0]}, (#{student[1]}) cohort"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
