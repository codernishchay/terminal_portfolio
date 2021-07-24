import 'dart:collection';
import 'dart:developer';
import 'dart:js_util';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Terminal extends StatefulWidget {
  Terminal({Key? key}) : super(key: key);

  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  // ScrollController _scrollController = ScrollController();
  TextEditingController controller = new TextEditingController();
  // GlobalKey key;
  FocusNode f = FocusNode();
  FocusNode f2 = FocusNode();
  @override
  void initState() {
    controller = TextEditingController();
    f = FocusNode();
    f2 = FocusNode();
    super.initState();
  }

  int counter = 0;
  List<String> str = [""];
  int value = 1;
  bool p = false;
  bool enable = true;

  String input = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
              0.2,
              0.5,
              0.8,
              0.7
            ],
                colors: [
              Colors.brown,
              Colors.orange,
              Colors.redAccent,
              Colors.red
            ])),
        padding: EdgeInsets.all(100),
        child: Scaffold(
          appBar: AppBar(
            elevation: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(0), bottom: Radius.circular(0))),
            title: Center(
              child: Text(
                "ubuntu@nishi",
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w100),
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Container(
                    color: Colors.blue,
                    child: Icon(
                      Icons.close_rounded,
                      size: 13,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            backgroundColor: Color.lerp(Colors.red, Colors.brown, 3),
            toolbarHeight: 25,
          ),
          body: Container(
            color: Colors.black87,
            padding: EdgeInsets.all(5),
            child: Container(
                child: ListView.builder(
                    itemCount: value,
                    itemBuilder: (context, index) {
                      return new Container(
                          child: Column(children: [
                        SizedBox(
                          child: new Row(
                            // direction: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 110,
                                child: Text("ubuntu@nishi \$" + "_",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.green)),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 2 / 4,
                                child: new FocusScope(
                                  node: FocusScopeNode(),
                                  child: new TextFormField(
                                    textInputAction: TextInputAction.done,
                                    autofocus: true,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 12, color: Colors.green[300]),
                                    decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        border: InputBorder.none),
                                    cursorColor: Colors.red,
                                    onFieldSubmitted: (term) {
                                      setState(() {
                                        counter++;
                                        enable = true;
                                        str.add(m[term].toString());
                                        f = new FocusNode();
                                        value++;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        enable
                            ? new Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Text(str[counter],
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100)),
                                ),
                              )
                            : Container()
                      ]));
                    }),
                alignment: Alignment.centerLeft),
          ),
        ));
  }

  Map<String, String> m = {
    "hi": "Hello Welcome to my world! lets enjoy the party folks...",
    "ls": "'which ' , 'hwich' , 'hello' , 'what', 'why' ",
    "": "",
    "help": "Help, \n",
    "whoami": "I am Nishchay verma" +
        "\n" +
        "Flutter Devleoper\nCyberSecurity Enthusiast"
  };
}
