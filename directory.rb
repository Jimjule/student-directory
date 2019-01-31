def input_students
  puts "Please enter the names of the students"
  puts "To finish, just leave the answers blank"
  @students = []
  name = STDIN.gets.chomp

  while !name.empty? do
    add_students(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
  @students
end

def add_students(name)
  @students << {name: name, cohort: :november}
end

students = input_students

def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print_student_list
  i = 0
  while i < @students.length
    puts "#{@students[i][:name]} #{@students[i][:cohort]} cohort"
    i += 1
  end
end

def print_footer
  puts "Overall we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_students(name).to_s
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename == nil
    filename = "students.csv"
  end
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def process
  case selection = STDIN.gets.chomp
  when "1"
    puts "Ready to input students."
    @students = input_students
  when "2"
    puts "Showing students, as requested:"
    show_students
  when "3"
    save_students
    puts "List of students saved to file."
  when "4"
    load_students
    puts "List of students loaded from file."
  when "9"
    puts "Goodbye."
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process
  end
end

try_load_students
interactive_menu
