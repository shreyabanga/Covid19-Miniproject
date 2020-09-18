import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String role;

Future<List> signInWithGoogle() async {
  //sign in with google popup
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  //get authenticationn tokens from google client
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  //get credentials from the authentication
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  //create an firebase authentication instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  //finally get user details with the credentials
  final FirebaseUser user = (await auth.signInWithCredential(credential)).user;
  role = await addToDatabase(user);
  //print("signed in ${user.displayName} with role $role");

  return [user, role];
}

Future<String> signOut() async {
  //create an firebase authentication instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  //sign out from both thee google client and auth
  await auth.signOut();
  GoogleSignIn().signOut();
}

Future<String> addToDatabase(FirebaseUser user) async {
  //create an firestore referece instance
  CollectionReference users = Firestore.instance.collection("Users");
  String role;
  //get a snapshiot of the users entries
  await users
      .document(user.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      //user is already there, no need to add it to database
      //return the user role
      print('Document exists');
      role = documentSnapshot.data['role'];
    } else {
      //user is not signed up, add data to firestore
      users.document(user.uid).setData({
        'uid': user.uid,
        'email': user.email,
        'name': user.displayName,
        'role': "user"
      }).then((value) {
        print("User Updated");
        role = "user";
      }).catchError((error) => print("Failed to update user: $error"));
    }
  });

  return role;
}

Future<String> checkAdmin(FirebaseUser user) async {
  //print("user is" + user.displayName);
  CollectionReference users = Firestore.instance.collection("Users");
  String role;
  await users
      .document(user.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    role = documentSnapshot.data['role'];
  });
  return role;
}
