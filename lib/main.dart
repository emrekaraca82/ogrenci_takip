import 'package:flutter/material.dart';
import 'package:ogrenci_takip/models/student.dart';
import 'package:ogrenci_takip/screens/students_add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Emre", "Karaca", 65),
    Student.withId(2, "Yunus", "Karaca", 48),
    Student.withId(3, "Mücahit", "Karaca", 35),
  ];

   Student selectedStudent = Student.withId(0, "Hiç Kimse", "", 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Ögrenci Takip Sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName + " " + students[index].lastName),
                  subtitle: Text("Sınavdan aldıgı not : " + students[index].grade.toString()+"["+students[index].getStatus+"]"),
                 leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://www.log.com.tr/wp-content/uploads/2017/04/Avatar-330-1000x562.jpg"),
                 ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: (){
                    setState(() {
                      this.selectedStudent = students[index];
                    });

                  },
                  onLongPress: (){
                    print("Uzun basildi");
                  },
                );
              }),
        ),
        Text("Seçili ögrenci "+selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Add ")
                  ],
                ),
                onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.blueGrey,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0,),
                    Text("Update")
                  ],
                ),
                onPressed: (){
                  print("Güncelle");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete_forever),
                    SizedBox(width: 5.0,),
                    Text("Remove")
                  ],
                ),
                onPressed: (){
                  print("Sil");
                },
              ),
            )
          ],
        )
      ],
    );
  }

 Widget buildStatusIcon(int grade) {
    if(grade>=50){
      return  Icon(Icons.done);
    }else if(grade>=40) {
      return Icon(Icons.album);
    }else {
      return Icon(Icons.clear);
    }
  }
}
