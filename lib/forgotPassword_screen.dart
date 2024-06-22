// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wardrobe/custom/custom.dart';
import 'package:wardrobe/custom/dialogBox.dart';
import 'package:wardrobe/login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> changePassword(String email, String newPassword) async {
    // Query the Firestore collection to find the document with the matching email
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('User')
        .where('email', isEqualTo: email)
        .get();

    // Check if there is a document with the provided email
    if (querySnapshot.docs.isNotEmpty) {
      // Get the document reference
      DocumentReference docRef = querySnapshot.docs.first.reference;

      // Update the password field of the document
      await docRef.update({'password': newPassword}).then((value) =>
          DialogHelper.showAlertDialog(
            context,
            'Reset',
            'Password reset successfully',
            () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ));
    } else {
      // Handle the case where no document is found with the provided email
      print('No document found with email: $email');

      DialogHelper.showAlertDialog(
        context,
        'Failed To Reset',
        'No document found with email: $email',
        () {},
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
                      top: MediaQuery.of(context).size.height * 0.38,
                    ),
                    child: TextFormField(
                      controller: emailController, // Use the controller
                      style: const TextStyle(
                          color: Colors.white), // Set text color to white
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,
                            color: Colors
                                .white), // Icon at the beginning with white color
                        hintText: 'Enter email',
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
                        prefixIcon: Icon(Icons.lock_outline,
                            color: Colors
                                .white), // Icon at the beginning with white color
                        hintText: 'Enter new password',
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
                  onPressed: () async {
                    changePassword(emailController.text.trim(),
                        passwordController.text.trim());
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const region_screen()));
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
                        "Save",
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
            ],
          ),
        ),
      ),
    );
  }
}
