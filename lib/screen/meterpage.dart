import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lovemeter/screen/result.dart';

class Meterpage extends StatefulWidget {
  const Meterpage({Key? key}) : super(key: key);

  @override
  State<Meterpage> createState() => _MeterpageState();
}

class _MeterpageState extends State<Meterpage> {
  final mynameController = TextEditingController();
  final mypartnernameController = TextEditingController();
  int lovemeter = Random().nextInt(100) + 1;
  final _formKey = GlobalKey<FormState>();
  late String validator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 80),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text("Your name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30)),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  // color: Colors.amber[600],
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.yellow),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: TextFormField(
                    controller: mynameController,
                    cursorColor: Colors.red,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter  your name',
                      prefixIcon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    validator: (mynameController) {
                      if (mynameController == null ||
                          mynameController.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    iconSize: 150,
                    icon: Icon(Icons.volunteer_activism)),

                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(" partner's name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30)),
                ),

                Container(
                  margin: const EdgeInsets.all(10.0),
                  // color: Colors.amber[600],
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.yellow),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: TextFormField(
                    controller: mypartnernameController,
                    cursorColor: Colors.red,
                    keyboardType: TextInputType.text,

                    // inputFormatters: [
                    //   LengthLimitingTextInputFormatter(10),
                    // ],
                    // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.text],
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                    ],
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter  your partner\'s name',
                      prefixIcon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    validator: (mypartnernameController) {
                      if (mypartnernameController == null ||
                          // mypartnernameController == r'^[0-3]$' ||
                          mypartnernameController.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: TextButton(
                          onPressed: () {
                            print(mynameController.text);
                            print(mypartnernameController.text);
                            print(lovemeter);

                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Resultpage(
                                          mynameController:
                                              mynameController.text,
                                          mypartnernameController:
                                              mypartnernameController.text,
                                          lovemeter: lovemeter,
                                        )),
                              );
                            }
                          },
                          child: const Text("Join"))),
                ),

                // Container(
                //   width: 200,
                //   decoration: BoxDecoration(
                //       color: Colors.amber[600],
                //       border: Border.all(color: Colors.yellow),
                //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
                //   child: TextField(
                //     decoration: new InputDecoration(
                //         border: new OutlineInputBorder(
                //             borderSide: new BorderSide(color: Colors.teal)),
                //         hintText: 'Tell us about yourself',
                //         helperText: 'Keep it short, this is just a demo.',
                //         labelText: 'Life story',
                //         prefixIcon: const Icon(
                //           Icons.person,
                //           color: Colors.green,
                //         ),
                //         prefixText: ' ',
                //         suffixText: 'USD',
                //         suffixStyle: const TextStyle(color: Colors.green)),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
