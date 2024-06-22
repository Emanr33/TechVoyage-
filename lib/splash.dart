// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wardrobe/splash2.dart';

//allows you to make changes at run time
class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    // Add a 5-second delay and navigate to the next screen
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const splash2_screen()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Container(
      //background Image
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        //encloses all components
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.5, //makes adjustments according to screens
                    width: MediaQuery.of(context).size.width * 1,
                    child: Image.asset('assets/images/splash2.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
