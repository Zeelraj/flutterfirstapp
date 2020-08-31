import 'package:flutter/material.dart';
// For, Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';
import '../showAlert.dart';
import '../dataPage.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Email and Password Sign In
  Future sIWEAP(String email, String password) async {
    AuthResult authResult =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = authResult.user;
    if (user != null) {
      print(email);
      print(password);
      print(user.uid);
      return user;
    } else {
      print('No User is Found..!!');
      return null;
    }
  }

  // Firebase Logout
  Future logOut() async {
    await auth.signOut();
    return 0;
  }
}

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: new Text('Logout'),
      onPressed: () async {
        dynamic result = await authService.logOut();
        if (result == 0) {
          print('User Logged Out..!!');
          var datapage = new MaterialPageRoute(
              builder: (BuildContext context) => new DataPage(
                    name: '',
                    email: '',
                    contact: '',
                    password: '',
                    uid: '',
                  ));
          Navigator.pop(context);
          Navigator.of(context).push(datapage);
        } else {
          String value = "User not Logged Out..!!";
          String title = "Error in Log out..!!";
          showAlertDialog(context, value, title);
        }
      },
    );
  }
}
