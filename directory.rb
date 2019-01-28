# First, we make an array of students
students = [
  "Hannibal Lector",
  "Darth Vader",
  "Michael Corleone",
  "Terminator",
  "The Joker",
  "Norman Bates"
]
# And then print them
def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
