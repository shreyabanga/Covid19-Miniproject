import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String noteID;

  bool get isEditing => noteID != null;

  NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(isEditing ? 'Edit Symptom' : 'Create Symptom')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Symptom'),
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(hintText: 'Symptom summary'),
            ),
            Container(height: 16),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
