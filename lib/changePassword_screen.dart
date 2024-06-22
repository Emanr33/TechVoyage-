// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wardrobe/custom/custom.dart';
import 'package:wardrobe/custom/dialogBox.dart';
import 'package:wardrobe/custom/sharedPreferences.dart';
import 'package:wardrobe/login_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  SnackBar snackbar = const SnackBar(
    content: Center(child: Text('Fill all feilds')),
    backgroundColor: Colors.green,
    elevation: 10.0,
    duration: Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(15.0),
  );

  Future<void> changePassword(String oldpassword, String newPassword) async {
    // Query the Firestore collection to find the document with the matching email
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('User')
        .where('password', isEqualTo: oldpassword)
        .get();

    // Check if there is a document with the provided email
    if (querySnapshot.docs.isNotEmpty) {
      // Get the document reference
      DocumentReference docRef = querySnapshot.docs.first.reference;

      // Update the password field of the document
      await docRef.update({'password': newPassword}).then((value) async {
        SharedPreferences instance = await SharedPreferences.getInstance();

        instance.remove('Password');

        storeLoginInfo('Password', newpasswordController.text.trim());
        DialogHelper.showAlertDialog(
          context,
          'Reset',
          'Password reset successfully',
          () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        );
      });
    } else {
      // Handle the case where no document is found with the provided email
      print('No User Found: $oldpassword');

      DialogHelper.showAlertDialog(
        context,
        'Failed To Reset',
        'No User Found',
        () {},
      );
    }
  }

  String? spPassword;
  getPassword() async {
    spPassword = await getStoredLoginInfo('Password');
  }

  @override
  void initState() {
    getPassword();
    super.initState();
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
          // backgroundColor: Colors.black12,
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 157, 62, 173),
          title: const Text('Change Password'),
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
                      controller: oldPasswordController, // Use the controller
                      style: const TextStyle(
                          color: Colors.white), // Set text color to white
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline,
                            color: Colors
                                .white), // Icon at the beginning with white color
                        hintText: 'Enter old password',
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
                      controller: newpasswordController, // Use the controller
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
                    if (oldPasswordController.text.isEmpty ||
                        newpasswordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } else {
                      if (oldPasswordController.text.trim() != spPassword) {
                        DialogHelper.showAlertDialog(context, 'Incorrect',
                            'Old password incorrect', () => null);
                      } else {
                        changePassword(oldPasswordController.text.trim(),
                            newpasswordController.text.trim());
                      }
                    }

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
                      Text(
                        "Reset Password",
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
