import 'package:flutter/material.dart';
import 'enterData.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CRUD Operations using Flutter"),
        ),
        body: Column(
          children: <Widget>[
            // XyzWidget(),
            // AbcWidget(),
            Blank(), //For Space Purpose
            Blank(),
            Blank(),
            new Flexible(child: EnterName()),
            new Flexible(child: EnterEmail()),
            new Flexible(child: EnterContact()),
            new Flexible(child: EnterPassword()),
            Blank(),
            Blank(),
            SubmitData(),
            // Row(
            //   children: <Widget>[
            //     XyzWidget(),
            //     AbcWidget(),
            //     new Flexible(child: EnterName()),
            //   ],
            // )
          ],
        ));
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("CRUD Operations using Flutter"),
//         ),
//         body: Column(
//           children: <Widget>[
//             // XyzWidget(),
//             // AbcWidget(),
//             Blank(), //For Space Purpose
//             Blank(),
//             Blank(),
//             new Flexible(child: EnterName()),
//             new Flexible(child: EnterEmail()),
//             new Flexible(child: EnterContact())
//             // Row(
//             //   children: <Widget>[
//             //     XyzWidget(),
//             //     AbcWidget(),
//             //     new Flexible(child: EnterName()),
//             //   ],
//             // )
//           ],
//         ));
//   }
// }

//For Space Purpose
class Blank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('');
  }
}

class XyzWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('XYZ ');
  }
}

class AbcWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('ABC ');
  }
}
