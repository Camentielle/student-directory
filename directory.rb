@students = [] # an empty array accessible to all methods

def print_menu
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. load the list from students.csv"
  puts "9. Exit"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# 3. do what the user has asked
def process(selection)
  case selection
  when "1"
   input_students
  when "2"
   show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
   exit # this will cause the program to terminate
  else
  puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
   print_menu
   # 2. read the input and save it into a variable
   process(STDIN.gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv","w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    return
  end

  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students(filename = "students.csv")
  # open csv file in read only mode
  file = File.open(filename,"r")
  # read content line per line
  file.readlines.each do |line|
  # convert list of students into a hash
  name, cohort = line.chomp.split (",")
  @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

puts ARGV.inspect
try_load_students # will load from students.csv by default
interactive_menu
