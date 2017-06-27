def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create a students array
  students = []
  #collect name
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students (students)
  index = 0
  until index >= students.count
    student = students [index]
    puts "#{student [:name]} (#{student [:cohort]} cohort)"
    index = index+1
  end

  #students.each_with_index do |student, index|
  #  if student[:name].length < 12
  #    puts "#{index+1}. #{student [:name]} (#{student [:cohort]} cohort)"
  #  end
  #end
end

def print_footer (adults)
  puts "Overall we have #{adults.count} great students"
end

idiots = input_students
print_header
print_students (idiots)
print_footer (idiots)
