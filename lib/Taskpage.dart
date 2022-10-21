import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'New_task_add.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({Key? key}) : super(key: key);

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  @override
  Query dbref = FirebaseDatabase.instance.ref().child('NOTES');
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasks To Do ..',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Add_task_screen())),
        },
        child: Icon(
          Icons.note_add_outlined,
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        height: double.infinity,
        color: Colors.cyanAccent,
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        child: FirebaseAnimatedList(
          query: dbref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map data = snapshot.value as Map;
            data['key'] = snapshot.key;
            return New_tasks(data['note'], data['subject'], data['key']);
          },
        ),
      ),
    );
  }
}

class New_tasks extends StatelessWidget {
  New_tasks(this.taskdo, this.taskdo2, this.idkey, {Key? key})
      : super(key: key);
  String taskdo;
  String taskdo2;
  String idkey;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$taskdo2',
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () async {
                      DatabaseReference ref =
                          FirebaseDatabase.instance.ref("NOTES/$idkey");
                      await ref.remove();
                    },
                    child: Text('Delete')),
              ],
            )
          ],
        ),
        Text(
          '$taskdo',
          style: TextStyle(fontSize: 20.0),
          maxLines: 3,
          textAlign: TextAlign.start,
        ),
        Divider(
          height: 10.0,
          color: Colors.black,
        )
      ],
    );
  }
}
