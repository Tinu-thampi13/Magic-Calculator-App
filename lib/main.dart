// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures, prefer_const_constructors_in_immutables, prefer_const_constructors
// Import all the necessary packages for the project.
import 'dart:math';
import 'package:flutter/material.dart';

//Main function starts
void main() => runApp(myApp());

//stateless widget for myApp()
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // To remove the Debug banner from the app emulator screen
      home: calculator(), // Calling the calculator function where all the operation occurs
    );
  }
}

class calculator extends StatefulWidget {
  calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  // Declaring and Initializing the necessary variables  
  String numtext = "";
  String rand = "";
  int count = 0;
  String dob = "";
  
  // Random function used for generating a random number Range(1-1000)
  String random() {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      rand = numtext + (rng.nextInt(1000)).toString();
    }
    return rand;
  }

  // Calculator UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 300,
              width: 380,
              child: ListView(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        numtext,
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28),
              child: Divider(
                color: Color.fromARGB(255, 106, 103, 103),
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        blocks("AC", Colors.red),
                        blocks("C", Colors.red),
                        blocks("%", Colors.green),
                        blocks("/", Colors.green)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        blocks("1"),
                        blocks("2"),
                        blocks("3"),
                        blocks("*", Colors.green)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        blocks("4"),
                        blocks("5"),
                        blocks("6"),
                        blocks("-", Colors.green)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        blocks("7"),
                        blocks("8"),
                        blocks("9"),
                        blocks("+", Colors.green)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        blocks("."),
                        blocks("0"),
                        blocks("00"),
                        blocks("=", Colors.amber)
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  // Calculation function
  Widget blocks(String text, [Color? color]) {
    return GestureDetector(
      onTap: () {
        if (text == "AC") {
          setState(() {
            numtext = "";
            count = 0;
          });
        } else if (text == "*") {
          if (count == 0) {
            dob = numtext;
            count += 1;
            numtext = numtext + "*";
          }
        } else if (text == ".") {
          setState(() {
            numtext = "";
            numtext = dob;
          });
          print(dob);
        } else if (text == "=") {
          setState(() {
            numtext = '';
            numtext = random();
          });
        } else {
          setState(() {
            numtext = numtext + text;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 25,
                color: color ?? Colors.white,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
