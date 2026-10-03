# ============================================================
# Python for Data Analytics - Practice Tasks
# Topic: Loops
# ============================================================


# ============================================================
# BASIC
# ============================================================


# ============================================================
# Q1. Print 1 to 100
# ============================================================

for number in range(1, 101):
    print(number)


# ============================================================
# Q2. Print Even Numbers
# ============================================================

for number in range(1, 101):
    if number % 2 == 0:
        print(number)


# ============================================================
# Q3. Sum of N Numbers
# ============================================================

n = int(input("Enter N: "))

total = 0

for number in range(1, n + 1):
    total += number

print("Sum:", total)


# ============================================================
# INTERMEDIATE
# ============================================================


# ============================================================
# Q4. Multiplication Table
# ============================================================

number = int(input("Enter a number: "))

for i in range(1, 11):
    print(number, "x", i, "=", number * i)


# ============================================================
# Q5. Reverse String
# ============================================================

text = input("Enter a string: ")

reversed_string = ""

for character in text:
    reversed_string = character + reversed_string

print("Reversed string:", reversed_string)


# ============================================================
# Q6. Count Vowels
# ============================================================

text = input("Enter a string: ")

vowel_count = 0

for character in text.lower():
    if character in "aeiou":
        vowel_count += 1

print("Number of vowels:", vowel_count)


# ============================================================
# ADVANCED
# ============================================================


# ============================================================
# Q7. Prime Number
# ============================================================

number = int(input("Enter a number: "))

is_prime = True

if number < 2:
    is_prime = False
else:
    for i in range(2, number):
        if number % i == 0:
            is_prime = False
            break

if is_prime:
    print("Prime number")
else:
    print("Not a prime number")


# ============================================================
# Q8. Fibonacci Series
# ============================================================

n = int(input("Enter number of terms: "))

first = 0
second = 1

for i in range(n):
    print(first, end=" ")

    next_number = first + second
    first = second
    second = next_number

print()


# ============================================================
# Q9. Pattern Printing
# ============================================================

rows = int(input("Enter number of rows: "))

for i in range(1, rows + 1):
    for j in range(i):
        print("*", end=" ")

    print()