import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:personal_expenses_app/Taskpage.dart';

class Add_task_screen extends StatelessWidget {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("NOTES");
  String subj = 'null';
  String note = 'nul';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write Her ... "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => {
          await ref.push().set({
            "subject": subj,
            "note": note,
          }),
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Taskpage())),
        },
        child: Icon(Icons.note_add),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            onChanged: (value) {
              subj = value;
            },
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Subject  ',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.format_line_spacing),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            onChanged: (value) {
              note = value;
            },
            keyboardType: TextInputType.multiline,
            autofocus: true,
            minLines: 1,
            maxLines: 10,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Your Note ',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
