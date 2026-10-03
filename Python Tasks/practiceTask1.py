# ============================================================
# Python for Data Analytics - Practical Exercise: Lecture 1.1
# ============================================================


# ============================================================
# Q1. Simple Output
# ============================================================

print("John")
print("Rajkot")
print("Welcome to Data Analytics")


# ============================================================
# Q2. User Input
# ============================================================

name = input("Enter your name: ")
age = int(input("Enter your age: "))

print(f"My name is {name} and I am {age} years old")


# ============================================================
# Q3. Multiple Inputs
# ============================================================

name = input("Enter your name: ")
course = input("Enter your course: ")
fees = float(input("Enter your fees: "))

print(name, course, fees)


# ============================================================
# Q4. Variable Assignment
# ============================================================

student_name = "John"
marks = 85
passed = True

print(student_name)
print(marks)
print(passed)


# ============================================================
# Q5. Multiple Assignment
# ============================================================

name, age, marks = "John", 22, 85

print(name)
print(age)
print(marks)


# ============================================================
# Q6. Swap Two Variables
# ============================================================

a = 10
b = 20

a, b = b, a

print("a =", a)
print("b =", b)


# ============================================================
# Q7. Identify Data Types
# ============================================================

integer_value = 10
float_value = 10.5
string_value = "Python"
boolean_value = True

print(type(integer_value))
print(type(float_value))
print(type(string_value))
print(type(boolean_value))


# ============================================================
# Q8. Type Conversion
# ============================================================

age = int(input("Enter your age: "))
salary = float(input("Enter your salary: "))

print("Age:", age)
print("Age type:", type(age))

print("Salary:", salary)
print("Salary type:", type(salary))


# ============================================================
# Q9. Mixed Operations
# ============================================================

x = 10
y = 5.5

result = x + y

print("Result:", result)
print("Type:", type(result))


# ============================================================
# Q10. Arithmetic Operations
# ============================================================

num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))

print("Addition:", num1 + num2)
print("Subtraction:", num1 - num2)
print("Multiplication:", num1 * num2)
print("Division:", num1 / num2)
print("Modulus:", num1 % num2)


# ============================================================
# Q11. Comparison Operators
# ============================================================

num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))

if num1 > num2:
    print("Greater number:", num1)
    print("Smaller number:", num2)
elif num2 > num1:
    print("Greater number:", num2)
    print("Smaller number:", num1)
else:
    print("Both numbers are equal")


# ============================================================
# Q12. Logical Operators
# ============================================================

value1 = input("Enter True or False: ") == "True"
value2 = input("Enter True or False: ") == "True"

print("AND:", value1 and value2)
print("OR:", value1 or value2)
print("NOT value1:", not value1)
print("NOT value2:", not value2)


# ============================================================
# Q13. Assignment Operators
# ============================================================

number = float(input("Enter a number: "))

number += 5
print("After += 5:", number)

number -= 2
print("After -= 2:", number)

number *= 3
print("After *= 3:", number)


# ============================================================
# Q14. Membership Operator
# ============================================================

text = input("Enter a string: ")
character = input("Enter a character to search: ")

print(character in text)


# ============================================================
# Q15. Identity Operator
# ============================================================

a = [1, 2, 3]
b = a
c = [1, 2, 3]

print("a is b:", a is b)
print("a is not b:", a is not b)

print("a is c:", a is c)
print("a is not c:", a is not c)


# ============================================================
# Q16. Student Details Program
# ============================================================

name = input("Enter student name: ")
age = int(input("Enter student age: "))
marks = float(input("Enter student marks: "))

print(f"Student {name} scored {marks} marks and is {age} years old")


# ============================================================
# Q17. Simple Interest Calculator
# ============================================================

principal = float(input("Enter principal amount: "))
rate = float(input("Enter rate of interest: "))
time = float(input("Enter time: "))

simple_interest = (principal * rate * time) / 100

print("Simple Interest:", simple_interest)


# ============================================================
# Q18. Salary Calculator
# ============================================================

basic_salary = float(input("Enter basic salary: "))

hra = basic_salary * 0.20
da = basic_salary * 0.10
total_salary = basic_salary + hra + da

print("Basic Salary:", basic_salary)
print("HRA:", hra)
print("DA:", da)
print("Total Salary:", total_salary)


# ============================================================
# Q19. Even or Odd
# ============================================================

number = int(input("Enter a number: "))

if number % 2 == 0:
    print("Even")
else:
    print("Odd")


# ============================================================
# Q20. Largest of Two Numbers
# ============================================================

num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))

if num1 > num2:
    print("Largest number:", num1)
elif num2 > num1:
    print("Largest number:", num2)
else:
    print("Both numbers are equal")