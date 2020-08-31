import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dataPage.dart';
import 'services/auth.dart';
import 'showAlert.dart';

var _enterNameController = TextEditingController();
var _enterEmailController = TextEditingController();
var _enterContactController = TextEditingController();
var _enterPasswordController = TextEditingController();

class EnterName extends StatefulWidget {
  @override
  _EnterNameState createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  @override
  void dispose() {
    super.dispose();
    _enterNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _enterNameController,
        autocorrect: false,
        autofocus: false,
        cursorColor: Colors.red,
        decoration: InputDecoration(
            icon: Icon(Icons.person), labelText: "Enter Your Name"),
        // textInputAction: TextInputAction.next,
        maxLength: 30,
        keyboardType: TextInputType.text,
        style: TextStyle(fontWeight: FontWeight.bold),
        // onChanged: (text) {
        //   print(text);
        // },
        onSubmitted: (text) {
          print(text);
        });
  }
}

class EnterEmail extends StatefulWidget {
  @override
  _EnterEmailState createState() => _EnterEmailState();
}

class _EnterEmailState extends State<EnterEmail> {
  @override
  void dispose() {
    super.dispose();
    _enterEmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _enterEmailController,
        autocorrect: false,
        autofocus: false,
        cursorColor: Colors.red,
        decoration: InputDecoration(
            icon: Icon(Icons.email), labelText: "Enter Your Email"),
        // textInputAction: TextInputAction.next,
        maxLength: 30,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontWeight: FontWeight.bold),
        // onChanged: (text) {
        //   print(text);
        // },
        onSubmitted: (email) {
          print(email);
        });
  }
}

class EnterContact extends StatefulWidget {
  @override
  _EnterContactState createState() => _EnterContactState();
}

class _EnterContactState extends State<EnterContact> {
  @override
  void dispose() {
    super.dispose();
    _enterContactController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _enterContactController,
        autocorrect: false,
        autofocus: false,
        cursorColor: Colors.red,
        decoration: InputDecoration(
            icon: Icon(Icons.contact_phone), labelText: "Enter Your Contact"),
        // textInputAction: TextInputAction.done,
        maxLength: 10,
        keyboardType: TextInputType.number,
        style: TextStyle(fontWeight: FontWeight.bold),
        // onChanged: (text) {
        //   print(text);
        // },
        onSubmitted: (contact) {
          print(contact);
        });
  }
}

class EnterPassword extends StatefulWidget {
  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  // @override
  // void dispose() {
  //   super.dispose();
  //   _enterPasswordController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _enterPasswordController,
        obscureText: true,
        autocorrect: false,
        autofocus: false,
        cursorColor: Colors.red,
        decoration: InputDecoration(
            icon: Icon(Icons.vpn_key), labelText: "Enter Your Password"),
        // textInputAction: TextInputAction.done,
        maxLength: 20,
        keyboardType: TextInputType.text,
        style: TextStyle(fontWeight: FontWeight.bold),
        // onChanged: (text) {
        //   print(text);
        // },
        onSubmitted: (contact) {
          print(contact);
        });
  }
}

class SubmitData extends StatefulWidget {
  @override
  SubmitDataState createState() => SubmitDataState();
}

class SubmitDataState extends State<SubmitData> {
  AuthService auth = new AuthService();
  FirebaseUser user;
  String uid;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: new Text("Submit"),
      onPressed: () async {
        if (_enterNameController.text.length != 0 &&
            _enterEmailController.text.length != 0 &&
            _enterContactController.text.length != 0 &&
            _enterPasswordController.text.length != 0) {
          if (_enterPasswordController.text.length >= 6) {
            print('This is working..!!');
            dynamic result = auth.sIWEAP(
                _enterEmailController.text, _enterPasswordController.text);
            if (result == null) {
              print('Error in Sign In..!!');
              String value = "Email or Password is wrong..!!";
              String title = "Authentication Failed..!!";
              showAlertDialog(context, value, title);
            } else {
              print('Signed In..!!');
              // Remaining From Here, Run and check via print statements.
              user = result;
              print('Result Value: $result');
              uid = user.uid;
              print("User Id in Enter Data Page 1: $uid");
              var datapage = new MaterialPageRoute(
                  builder: (BuildContext context) => new DataPage(
                        name: _enterNameController.text,
                        email: _enterEmailController.text,
                        contact: _enterContactController.text,
                        password: _enterPasswordController.text,
                        uid: uid,
                      ));
              print("User Id in Enter Data Page 2: $uid");
              Navigator.of(context).push(datapage); //Option 1
              // Navigator.push(context, datapage); //Option 2
              print("User Id in Enter Data Page 3: $uid");
            }
          } else {
            // new Text("Password Must be 6 Characters Long");
            // print("Password Must be long more then 6 Characters.");
            String value = "Password Must be long more then 6 Characters.";
            String title = "Password Alert..!!";
            showAlertDialog(context, value, title);
          }
        } else {
          String value = "Please, Fill up All Values";
          String title = "Field Empty Alert..!!";
          showAlertDialog(context, value, title);
        }
      },
    );
  }
}
