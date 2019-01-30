def input_students
  puts "Please enter the names of the students"
  puts "To finish, just leave the answers blank"
  @students = []
  name = gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
  @students
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

def process
  case selection = gets.chomp
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
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

interactive_menu
