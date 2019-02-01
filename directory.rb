require 'csv'

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just leave the answers blank"
  @students = []
  @name = STDIN.gets.chomp
  puts "Enter their cohort"
  cohort = STDIN.gets.chomp

  while !@name.empty? do
    add_students(cohort = "november")
    puts "Now we have #{@students.count} students"
    puts "Enter their name"
    @name = STDIN.gets.chomp
    puts "Enter their cohort"
    cohort = STDIN.gets.chomp
  end
  @students
end

def add_students(cohort = "november")
  @students << {name: @name, cohort: cohort}
end

students = input_students

def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print_student_list
  @students.each.with_index(1) do |student, index|
    puts "#{index} #{student[:name]}, #{student[:cohort]} cohort"
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

def save_students(save_name = "students.csv")
  save_name = "students.csv" if save_name.to_s.empty?
  file = File.open(save_name, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "List saved to #{save_name}"
end

def load_students(filename = "students.csv")
  filename = "students.csv" if filename.to_s.empty?
  CSV.foreach("students.csv") do |row|
    row.each do |line|
      add_students
    end
  end
  puts "List loaded from #{filename}."
end

def try_load_students
  filename = ARGV.first
  if filename == nil
    filename = "students.csv"
  elsif filename == ''
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
    save_students(save_name = gets.chomp)
  when "4"
    load_students(filename = gets.chomp)
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
