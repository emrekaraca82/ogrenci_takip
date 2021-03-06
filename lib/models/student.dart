class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String status;

  Student(String firstName,String lastName,int grade){
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withId(int id,String firstName,String lastName,int grade){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getStatus{
    String message ="";
    if(this.grade>=50){
      message = "Geçti";
    }else if(this.grade >40){
      message = "Bütnlemeye Kaldı";
    }else {
      message = "Kaldı";
    }
    return message;
  }
}