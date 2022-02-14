import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About_Me extends StatefulWidget {
  const About_Me({Key? key}) : super(key: key);

  @override
  _About_MeState createState() => _About_MeState();
}

class _About_MeState extends State<About_Me> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
              child: Text(
            "About Me!",
            style: GoogleFonts.lobster(),
          )),
        ),
      )),
    );
  }
}
