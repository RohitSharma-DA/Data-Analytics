# ============================================================
# Python for Data Analytics - Practical Exercise: Lecture 2
# Control Flow
# ============================================================


# ============================================================
# Q1. Even or Odd
# ============================================================

number = int(input("Enter a number: "))

if number % 2 == 0:
    print("Even")
else:
    print("Odd")


# ============================================================
# Q2. Positive, Negative, or Zero
# ============================================================

number = float(input("Enter a number: "))

if number > 0:
    print("Positive")
elif number < 0:
    print("Negative")
else:
    print("Zero")


# ============================================================
# Q3. Voting Eligibility
# ============================================================

age = int(input("Enter your age: "))

if age >= 18:
    print("Eligible")
else:
    print("Not Eligible")


# ============================================================
# Q4. Largest of Two Numbers
# ============================================================

num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))

if num1 > num2:
    print("Largest:", num1)
elif num2 > num1:
    print("Largest:", num2)
else:
    print("Both numbers are equal")


# ============================================================
# Q5. Largest of Three Numbers
# ============================================================

num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))
num3 = float(input("Enter third number: "))

if num1 >= num2 and num1 >= num3:
    print("Largest:", num1)
elif num2 >= num1 and num2 >= num3:
    print("Largest:", num2)
else:
    print("Largest:", num3)


# ============================================================
# Q6. Divisibility Check
# ============================================================

number = int(input("Enter a number: "))

if number % 3 == 0 and number % 5 == 0:
    print("Divisible by both 3 and 5")
elif number % 5 == 0:
    print("Divisible by 5")
elif number % 3 == 0:
    print("Divisible by 3")
else:
    print("Not divisible by 3 or 5")


# ============================================================
# Q7. Working Age Check
# ============================================================

age = int(input("Enter your age: "))

if 18 <= age <= 60:
    print("Working age")
else:
    print("Not working age")


# ============================================================
# Q8. Grade System
# ============================================================

marks = float(input("Enter marks: "))

if marks >= 90:
    print("Grade: A")
elif marks >= 75:
    print("Grade: B")
elif marks >= 50:
    print("Grade: C")
else:
    print("Grade: Fail")


# ============================================================
# Q9. Salary Classification
# ============================================================

salary = float(input("Enter salary: "))

if salary > 50000:
    print("High")
elif salary >= 20000:
    print("Medium")
else:
    print("Low")


# ============================================================
# Q10. Day Finder
# ============================================================

day_number = int(input("Enter day number (1-7): "))

if day_number == 1:
    print("Monday")
elif day_number == 2:
    print("Tuesday")
elif day_number == 3:
    print("Wednesday")
elif day_number == 4:
    print("Thursday")
elif day_number == 5:
    print("Friday")
elif day_number == 6:
    print("Saturday")
elif day_number == 7:
    print("Sunday")
else:
    print("Invalid day number")


# ============================================================
# Q11. Loan Eligibility
# ============================================================

age = int(input("Enter your age: "))
salary = float(input("Enter your salary: "))

if age > 18 and salary > 25000:
    print("Eligible")
else:
    print("Not Eligible")


# ============================================================
# Q12. Login System
# ============================================================

username = input("Enter username: ")
password = input("Enter password: ")

if username == "admin" and password == "1234":
    print("Login Successful")
else:
    print("Invalid Credentials")


# ============================================================
# Q13. Simple Calculator
# ============================================================

num1 = float(input("Enter first number: "))
operator = input("Enter operator (+, -, *, /): ")
num2 = float(input("Enter second number: "))

if operator == "+":
    print("Result:", num1 + num2)
elif operator == "-":
    print("Result:", num1 - num2)
elif operator == "*":
    print("Result:", num1 * num2)
elif operator == "/":
    if num2 != 0:
        print("Result:", num1 / num2)
    else:
        print("Cannot divide by zero")
else:
    print("Invalid operator")


# ============================================================
# Q14. Electricity Bill
# ============================================================

units = float(input("Enter units consumed: "))

if units <= 100:
    bill = units * 5
elif units <= 200:
    bill = units * 7
else:
    bill = units * 10

print("Electricity Bill:", bill)


# ============================================================
# Q15. Leap Year Checker
# ============================================================

year = int(input("Enter a year: "))

if year % 400 == 0:
    print("Leap Year")
elif year % 100 == 0:
    print("Not a Leap Year")
elif year % 4 == 0:
    print("Leap Year")
else:
    print("Not a Leap Year")


# ============================================================
# Q16. Triangle Type
# ============================================================

side1 = float(input("Enter first side: "))
side2 = float(input("Enter second side: "))
side3 = float(input("Enter third side: "))

if side1 == side2 == side3:
    print("Equilateral")
elif side1 == side2 or side1 == side3 or side2 == side3:
    print("Isosceles")
else:
    print("Scalene")


# ============================================================
# Q17. Character Check
# ============================================================

character = input("Enter a character: ")

if character.lower() in "aeiou":
    print("Vowel")
else:
    print("Consonant")


# ============================================================
# Q18. Temperature Check
# ============================================================

temperature = float(input("Enter temperature: "))

if temperature < 10:
    print("Cold")
elif temperature <= 25:
    print("Normal")
else:
    print("Hot")