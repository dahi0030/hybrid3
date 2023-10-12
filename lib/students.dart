class Students {
  List<Map<String, String>> studentsList;

  Students(this.studentsList);

  factory Students.fromJson(List<dynamic> jsonList) {
    final students = jsonList
        .map((student) => {
              "first": student["first"].toString(),
              "last": student["last"].toString(),
              "email": student["email"].toString(),
            })
        .toList();

    return Students(students);
  }

  void sort(String field) {
    print("\n Sorted Student List:");
    studentsList.sort((a, b) => (a[field] ?? '').compareTo(b[field] ?? ''));
  }

  void addStudent(Map<String, String> student) {
    print("\n Added Student:");
    studentsList.add(student);
  }

  void removeStudent(String lastName) {
    print("\n Removed Student:");
    studentsList.removeWhere((student) => student['last'] == lastName);
  }

  void output() {
    studentsList.forEach((student) => print(student));
  }
}
