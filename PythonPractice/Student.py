class Boys:
    def __init__(self,gender):
        self.gender=gender

class Student:
    def __init__(self,name,age):
        self.name=name
        self.age=age
        self.grades = []

    def add_grades(self, *grades):
        self.grades.extend(grades)

    def displayStudent(self):
        print(f"Name : {self.name} and age : {self.age} and grades : {self.grades}")


    def average_grade(self):
        if not self.grades:
            return None
        return sum(self.grades) / len(self.grades)

student1 = Student("Rahul", 20)
student1.add_grades(88, 92, 75)

student2 = Student("Aman",22)
student2.add_grades(87,97,87)

student3 = Student("Karan",24)
student3.add_grades(89,90,89)

# print(student1.name , student1.age)
# print(student1.grades)
# print(student1.average_grade())

students = [student1, student2, student3]

# for s in students:
#     print("Name:", s.name)
#     print("Age:", s.age)
#     print("Grades:", s.grades)
#     avg = s.average_grade()
#     print("Average Grade:", round(avg, 2) if avg is not None else "No grades yet")
#     print("-" * 30)


# student1.displayStudent()

for student in students:
    student.displayStudent()