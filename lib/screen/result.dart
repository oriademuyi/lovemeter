import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lovemeter/screen/meterpage.dart';

class Resultpage extends StatefulWidget {
  String mynameController, mypartnernameController;
  int lovemeter;

  Resultpage({
    Key? key,
    required this.mynameController,
    required this.mypartnernameController,
    required this.lovemeter,
  }) : super(key: key);

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
        ),
        child: Center(
          child: Column(
            children: [
              Text(widget.mynameController,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                      fontSize: 30)),
              // const Icon(
              //   Icons.favorite,
              //   color: Colors.white,
              //   size: 60.0,
              // ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 60.0,
                  ),
                  widget.lovemeter > 45
                      ? Icon(
                          Icons.gpp_good,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.gpp_bad,
                          color: Colors.red,
                        )
                ],
              ),
              Text(widget.mypartnernameController,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                      fontSize: 30)),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 100.0,
                        ),
                        Text(widget.lovemeter.toString() + "%",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              // Text(widget.lovemeter.toString() + "%"),
              widget.lovemeter >= 80
                  ? Text("love is over 80%",
                      style: TextStyle(fontSize: 20, color: Colors.white))
                  : widget.lovemeter < 80 && widget.lovemeter >= 60
                      ? Text("love is between 60 and 80")
                      : widget.lovemeter < 60 && widget.lovemeter >= 45
                          ? Text("love is between 45 and 60",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white))
                          : widget.lovemeter <= 45
                              ? Text("love is bellow 45")
                              : Container(),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                    margin: EdgeInsets.all(10.0),
                    // color: Colors.amber[600],
                    width: 150.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Meterpage()),
                          );
                        },
                        child: const Text("Try again"))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                    margin: EdgeInsets.all(10.0),
                    // color: Colors.amber[600],
                    width: 150.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: TextButton(
                        onPressed: () {}, child: const Text("Save & Share"))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
