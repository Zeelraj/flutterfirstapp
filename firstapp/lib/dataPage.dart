import 'package:flutter/material.dart';
import 'myHomePage.dart';
import 'services/auth.dart';

// For, Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';
// For, Google Authentication using Firebase
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class DataPage extends StatefulWidget {
  final String name;
  final String email;
  final String contact;
  final String password;
  final String uid;

  DataPage(
      {Key key, this.name, this.email, this.contact, this.password, this.uid})
      : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Data Page"),
      ),
      // body: new Text("Name: ${widget.name}"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Flexible(child: new Text("Name: ${widget.name}")),
          // Blank(),
          new Flexible(child: new Text("Email: ${widget.email}")),
          // Blank(),
          new Flexible(child: new Text("Contact: ${widget.contact}")),
          // Blank(),
          new Flexible(child: new Text("Password: ${widget.password}")),
          // Blank(),
          new Flexible(child: new Text("User ID: ${widget.uid}")),
          Blank(),
          Blank(),
          Logout()
        ],
      ),
    );
  }
}
