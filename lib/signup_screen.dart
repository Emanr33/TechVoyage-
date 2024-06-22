// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wardrobe/custom/custom.dart';
import 'package:wardrobe/login_screen.dart';
import 'package:wardrobe/region.dart';
import 'package:wardrobe/staticData.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> addUser() async {
    // Get a Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to a collection
    CollectionReference collection = firestore.collection('User');

    // Data to be stored
    Map<String, dynamic> data = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };

    // Add the data to Firestore
    try {
      await collection.add(data);
      print('Data added successfully');
      nameController.clear();
      emailController.clear();
      passwordController.clear();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('${nameController.text} Added'),
            content: Text('${nameController.text} Added successfully'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error adding data: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Insertion Failed'),
            content: Text('Error adding User: $e'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //background Image
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/loginimage.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          //title: const Text('Your App Title'),
          actions: [
            Data.myAccount
                ? Container()
                : TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const region_screen()));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.07, right: 90),
                child: Center(child: customTextbold(data: 'Wardrobe')),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.14, right: 90),
                child: Center(child: customTextbold(data: 'Wonders')),
              ),

              Center(
                child: SizedBox(
                  width: 270,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.30,
                    ),
                    child: TextFormField(
                      controller: nameController, // Use the controller
                      style: const TextStyle(
                          color: Colors.white), // Set text color to white
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            color: Colors
                                .white), // Icon at the beginning with white color
                        hintText: 'Name',
                        hintStyle:
                            TextStyle(color: Colors.white), // Hint text color
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: SizedBox(
                  width: 270,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.38,
                    ),
                    child: TextFormField(
                      controller: emailController, // Use the controller
                      style: const TextStyle(
                          color: Colors.white), // Set text color to white
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email,
                            color: Colors
                                .white), // Icon at the beginning with white color
                        hintText: 'Email or Phone',
                        hintStyle:
                            TextStyle(color: Colors.white), // Hint text color
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 270,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.46,
                    ),
                    child: TextFormField(
                      controller: passwordController, // Use the controller
                      style: const TextStyle(
                          color: Colors.white), // Set text color to white
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock,
                            color: Colors
                                .white), // Icon at the beginning with white color
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: Colors.white), // Hint text color
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 470, left: 65),
                child: ElevatedButton(
                  onPressed: () {
                    addUser();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // Set background color to white
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      minimumSize:
                          const Size(240, 40) // Adjust padding as needed
                      ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.account_box,
                        color: Colors.black, // Set icon color to black
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black, // Set text color to black
                          fontSize: 16.0,
                        ),
                      ),
                      // Add spacing between text and icon
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 520, left: 65),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const region_screen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue, // Set background color to white
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      minimumSize:
                          const Size(240, 40) // Adjust padding as needed
                      ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.account_box,
                        color: Colors.white, // Set icon color to black
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "Log in with facebook ",
                        style: TextStyle(
                          color: Colors.white, // Set text color to black
                          fontSize: 16.0,
                        ),
                      ),

                      // Add spacing between text and icon
                    ],
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 600, left: 90),
                  child: Text(
                    "Already Have an account?Log in",
                    style: TextStyle(
                      color: Colors.white, // Set text color to black
                      fontSize: 16.0,
                    ),
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
