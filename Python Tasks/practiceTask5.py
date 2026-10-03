# ============================================================
# Python for Data Analytics - Practice Questions
# Topic: Strings, Lists, and Dictionaries
# ============================================================


# ============================================================
# Q1. Convert String into Uppercase
# ============================================================

text = input("Enter a string: ")

uppercase_text = text.upper()

print("Uppercase:", uppercase_text)


# ============================================================
# Q2. Split Sentence into Words
# ============================================================

sentence = input("Enter a sentence: ")

words = sentence.split()

print("Words:", words)


# ============================================================
# Q3. Add 5 Values into List using append()
# ============================================================

numbers = []

for i in range(5):
    value = int(input(f"Enter value {i + 1}: "))
    numbers.append(value)

print("List:", numbers)


# ============================================================
# Q4. Sort List in Descending Order
# ============================================================

numbers = [25, 10, 45, 5, 30]

numbers.sort(reverse=True)

print("Descending order:", numbers)


# ============================================================
# Q5. Create Dictionary and Print Keys & Values
# ============================================================

student = {
    "name": "John",
    "age": 22,
    "course": "Data Analytics",
    "percentage": 85.5
}

print("Keys:")

for key in student.keys():
    print(key)

print("Values:")

for value in student.values():
    print(value)