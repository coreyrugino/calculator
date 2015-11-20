#1119calc.rb

# calculate.rb
# Basic Objectives
# ==================DONE==============================================
# Create a ruby file called calculator.rb
# Take user input for the left hand of the equation
# Take user input for the operator of the equation
# Take user input for the right hand of the equation
# Calculate the correct answer and output it to the user
# Handle cases: Addition, Subtraction, Division, and Multiplication

# Bonus Objectives
# ==================DONE==============================================
# Refactor to only take user input once
# eg. What is the equation?
# user input: 1 + 1
# hint: you’ll need to split the user input to get the values out

# ==================DONE==============================================
# Organize your code to use methods

# ==================DONE==============================================
# Have the calculator ask for new equations over and over
# hint: use a loop

# ==================PROBLEMS==============================================
#integer_check does not do what i want, but it still passes the code threw equation

# Have the calculator store the last result so you can do a new equation and add to the previous result
# Have a clear function so you don’t keep adding to the last result if you don’t want to
# Store a history of the users equations and answers
# hint: use hashes - you don’t really know this yet.
# https://rubymonk.com/learning/books/1-ruby-primer/chapters/10-hashes-in-ruby/lessons/46-introduction-to-ruby-hashes

#==========================NEXT 1119================
#Tips:
# Next for calc
#5.send(+, 20)
# num.send(input.to_sym, num2)
#Update:
#use hashes to creat a better working calculator
#====================================================
# CODE CODE CODE
#====================================================

# code below will have 3 dif imputs
# puts "input first numer:"
# num1 = gets.to_i
# puts "input operative:"
# opt = gets.strip
# puts "input last number:"
# num2 = gets.to_i


@history = {}
#=========================
#  ask equation
#=========================
def ask_equation
  #question = yes
  puts "Input an equation EX 2 + 3 or 8 ** (square)"
  equation = gets.strip
  seperated = equation.split(" ")

  # this will put the value equation into the key store and save it in hash history

  @store = @history.count + 1

  @history[@store.to_s.to_sym] = equation

  num1 = seperated[0]
  num2 = seperated[2]
  opt = seperated[1]
  if num1 == 'back'
    priorequations
  else
    integer_check(num1, opt, num2)
    #puts seperated
    #calculate(num1, opt, num2)
    #puts "calculate again?"
    repeat
  end
end


#=========================
# repeat
#=========================
def repeat
  puts "calculate again [yes/no] or look at prior questions [back]"
  rans = gets.strip.downcase
  if rans == 'yes'
    ask_equation
  elsif rans == 'no'
    exit(0)
  elsif rans == "back"
    priorequations
  else
    puts "error: use yes / no for your answer"
    repeat
  end
end


#=========================
#  integer_check
# still not working, but still works threw it and compiles like its not there.
#=========================
# def integer_check(num1, opt, num2)
#   #puts "checking for integers."
#   # if opt == '**'
#   #   square
#   if num1.to_s != num1.to_i.to_s
#     puts "1st not integer"
#     ask_equation
#   elsif num2.to_s != num2.to_i.to_s
#     puts "2nd not integer"
#     ask_equation
#   else
#     equation(num1, opt, num2)
#   end
#
#    #puts @store[:var1]
# end

#=============================================================
# this one will let square go threw with just the 1st integer
#=============================================================

  #puts "checking for integers."
  # if opt == '**'
  #   square
def integer_check(num1, opt, num2)
  if num1.to_s != num1.to_i.to_s
    puts "1st not integer"
    ask_equation
  elsif opt == '**'
    equation(num1, opt, num2)
  elsif num2.to_s != num2.to_i.to_s
    puts "2nd not integer"
    ask_equation
  else
    equation(num1, opt, num2)
  end

   #puts @store[:var1]
end



#=========================
#  equation
#=========================
#methods for the calculator to run
def equation(num1, opt, num2)
  num1 = num1.to_i
  num2 = num2.to_i
  #puts "#{num1} #{opt} #{num2} ="
  calculate(num1, opt, num2)
end


#=========================
#  calculate
#=========================
#puts "#{num1} #{opt} #{num2} ="
def calculate(num1, opt, num2)
  case opt

  # addition
  when '+'
    addition(num1, num2)

  #subtraction
  when '-'
   subtraction(num1, num2)

  #multiplication
  when '*'
    multiply(num1, num2)

  #Division
  when '/'
    division(num1, num2)

  #square
  when '**'
    square(num1)
  # if it does not work(wrong key was used)
  else
    puts "error"
  end
end


#=========================
#  + - * / **
#=========================
def addition(num1, num2)
  puts [num1.send('+', num2)]
end

def subtraction(num1, num2)
  puts [num1.send('-', num2)]
end

def multiply(num1, num2)
  puts [num1.send('*', num2)]
end

def division(num1, num2)
  if num2 == 0
    puts "error: can't divide by 0"
    ask_equation
  else
    puts [num1.send('/', num2)]
  end
end

def square(num1)
  puts [num1.send('*', num1)]
  # ans = num1 * num1
  # puts "#{ans}"
end

def priorequations
 puts "here are the prior equations"
 puts @history
 #to bring back to repeat
 repeat

end

#equation(3, '+', 4)
ask_equation
