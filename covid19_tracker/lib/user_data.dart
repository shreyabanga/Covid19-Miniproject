import 'package:cloud_firestore/cloud_firestore.dart';

List usersSubmitted;
List<Map<String, Map<String, dynamic>>> usersNotSubmitted;
Map<String, String> map = {"hi": "hiiii"};

Future<List<String>> missingForms() async {
  //List<String>  noFormUsers = [];

  usersSubmitted = [];
  usersNotSubmitted = [];

  var date = new DateTime.now().toString().substring(0, 10);
  //create an firestore referece instance
  CollectionReference users = Firestore.instance.collection("Users");
  CollectionReference forms = Firestore.instance.collection("Forms");

  await forms.document(date).get().then((value) {
    usersSubmitted = value.data["submitted"];
  });

  await users.getDocuments().then((value) {
    for (DocumentSnapshot e in value.documents)
      usersNotSubmitted.add({
        e.documentID: {'email': e.data['email'], 'name': e.data['name']}
      });
  });

  print(usersNotSubmitted);

  //usersNotSubmitted.removeWhere((e) => !usersSubmitted.contains(e));
}
