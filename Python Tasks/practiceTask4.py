# ============================================================
# Python for Data Analytics - Practice Questions
# Topic: Variables, Data Types, Lists, Dictionaries
# ============================================================


# ============================================================
# Q1. Print Data Types
# ============================================================

name = "John"
age = 22
percentage = 85.5
is_pass = True

print("Name type:", type(name))
print("Age type:", type(age))
print("Percentage type:", type(percentage))
print("Is Pass type:", type(is_pass))


# ============================================================
# Q2. Create and Modify a List
# ============================================================

cities = ["Ahmedabad", "Mumbai", "Delhi", "Pune", "Rajkot"]

print("Original list:", cities)

# Replace one city
cities[2] = "Bangalore"

print("Updated list:", cities)


# ============================================================
# Q3. Student Information Dictionary
# ============================================================

student = {
    "name": "John",
    "age": 22,
    "percentage": 85.5,
    "course": "Data Analytics",
    "is_pass": True
}

print("Student Information:")
print(student)


# ============================================================
# Q4. Type Conversion
# ============================================================

# String to Integer
value1 = "100"
value1 = int(value1)

# Integer to String
value2 = 50
value2 = str(value2)

# Integer to Float
value3 = 10
value3 = float(value3)

print("Value 1:", value1, "Type:", type(value1))
print("Value 2:", value2, "Type:", type(value2))
print("Value 3:", value3, "Type:", type(value3))