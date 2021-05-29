import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_takip/models/student.dart';

class StudentAdd extends StatefulWidget{

  List<Student> students;
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAddState();
  }
  
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  var student = Student("","",0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(title: Text("New Student Screen"),),
     body: Container(
       margin: EdgeInsets.all(20.0),
       child: Form(
         key: formKey,
         child: Column(
           children: <Widget>[
             buildFirstNameField(),
             buildLastNameField(),
             buildGradeField(),
             buildSubmitButton()
           ],
         ),
       ),
     ),
   );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "First Name"),
      onSaved: (String value){
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Last Name"),
      onSaved: (String value){
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Grade"),
      onSaved: (String value){
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Add"),
      color: Colors.green,

      onPressed:(){
        formKey.currentState.save();
       widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}