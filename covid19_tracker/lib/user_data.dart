import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var date = new DateTime.now().toString().substring(0, 10);

//for admin data display
Future<List> missingForms() async {
  List usersSubmitted = [];
  List<Map<String, dynamic>> usersNotSubmitted = [];

  //create an firestore referece instance
  CollectionReference users = Firestore.instance.collection("Users");
  CollectionReference forms = Firestore.instance.collection("Forms");

  await forms.document(date).get().then((value) {
    if (value.data == null)
      usersSubmitted = [];
    else
      usersSubmitted = value.data["submitted"];
  });

  await users.getDocuments().then((value) {
    for (DocumentSnapshot e in value.documents)
      if (e.data['role'] != "admin") {
        usersNotSubmitted.add({
          'uid': e.data['uid'],
          'email': e.data['email'],
          'name': e.data['name']
        });
      }
    for (Map entry in usersSubmitted) {
      usersNotSubmitted
          .removeWhere((element) => entry['uid'] == element['uid']);
    }
  });
  return [usersSubmitted, usersNotSubmitted];
}

//when user presses submit
Future<void> submitForm(Map symptoms) async {
  //create an firestore referece instance
  CollectionReference userSymptoms = Firestore.instance.collection("Symptoms");
  CollectionReference symptomsSummary =
      Firestore.instance.collection("Symptoms_Summary");
  CollectionReference forms = Firestore.instance.collection("Forms");

  FirebaseUser user = await FirebaseAuth.instance.currentUser();

  //add user details to database for those who submitted the form
  await forms.document(date).setData({
    'submitted': FieldValue.arrayUnion([
      {'uid': user.uid, 'email': user.email, 'name': user.displayName}
    ])
  }, merge: true);

  //initialize symptoms counter to database for the today
  await symptomsSummary
      .document(date)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (!documentSnapshot.exists) {
      symptomsSummary.document(date).setData({
        'cough': 0,
        'soreThroat': 0,
        'fever': 0,
        'diarrhea': 0,
        'nausea': 0,
        'headache': 0,
        'fatigue': 0,
        'taste': 0,
        'smell': 0,
        'chestPain': 0,
      }, merge: true).then((value) {
        print("symp added");
      });
    }
  });

  //add individual symptoms and their values under each user
  //also incrementing the symptoms counter
  await userSymptoms
      .document(user.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (!documentSnapshot.data.containsKey(date)) {
      userSymptoms
          .document(user.uid)
          .setData({date: symptoms}, merge: true).then((value) {
        symptoms.forEach((key, _) {
          symptomsSummary.document(date).updateData({
            key: FieldValue.increment(1),
          });
        });
        print("symp added");
      });
    }
  });
}

//check if current user has subbmitted the form
Future<bool> checkSubmission() async {
  CollectionReference userSymptoms = Firestore.instance.collection("Symptoms");
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  bool result;

  await userSymptoms
      .document(user.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    result = documentSnapshot.data.containsKey(date);
  });

  return result;
}

Future<Map> getStats() async {
  Map result;
  CollectionReference symptomsSummary =
      Firestore.instance.collection("Symptoms_Summary");

  await symptomsSummary
      .document(date)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (!documentSnapshot.exists) {
      result = {
        'cough': 0,
        'soreThroat': 0,
        'fever': 0,
        'diarrhea': 0,
        'nausea': 0,
        'headache': 0,
        'fatigue': 0,
        'taste': 0,
        'smell': 0,
        'chestPain': 0,
      };
    } else {
      result = documentSnapshot.data;
    }
  });
  return result;
}
