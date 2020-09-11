import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<String> signInWithGoogle() async {
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
  print("signed in " + user.displayName);
 
  return user.displayName;
  
}

Future<void> signOut() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();
  GoogleSignIn().signOut();
  
}

Future<String> getCurrentUser() async{

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseUser user = await auth.currentUser();
  
  if (user== null)
    return "";
  else 
    return user.displayName;


}