// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wardrobe/bottombar.dart';
import 'package:wardrobe/custom/custom.dart';
import 'package:wardrobe/custom/sharedPreferences.dart';
import 'package:wardrobe/region.dart';
import 'package:wardrobe/forgotPassword_screen.dart';
import 'package:wardrobe/signup_screen.dart';
import 'package:wardrobe/staticData.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> verifyEmailAndPassword(String email, String password) async {
    try {
      // Query Firestore to find the document ID associated with the user's email
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      // Assuming there's only one document with this email, get its ID

      if (querySnapshot.docs.isNotEmpty) {
        String documentId = querySnapshot.docs[0].id;
        // var userData = querySnapshot.docs[0].data();
        // String name = userData['Name'];
        DocumentSnapshot doc = querySnapshot.docs.first;
        String userName = doc.get('name');
        print('##  $userName');
        print('##  $documentId');
        SharedPreferences instance = await SharedPreferences.getInstance();
        instance.remove('Email');
        instance.remove('Password');
        instance.remove('DocId');
        instance.remove('name');

        storeLoginInfo('Email', emailController.text.trim());
        storeLoginInfo('Password', passwordController.text.trim());
        storeLoginInfo('DocId', documentId);
        storeLoginInfo('name', userName);

        // Now you have both the authentication result and the document ID
        print('Authentication successful with document ID: $documentId');
        FocusScope.of(context).unfocus();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const bottombar(
              selectedCity: '',
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Invalid Credentials'),
              content:
                  const Text('The email or password you entered is incorrect.'),
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
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('$e'),
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

      print('Failed to verify email and password: $e');
    }
  }

  //sign in with google
  signInWithGoogle() async {
    GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleuser!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user!.displayName);
    print(userCredential.user!.photoURL);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => bottombar(selectedCity: ''),
      ),
    );
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
                        hintText: 'Enter Email',
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
                        hintText: 'Enter Password',
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
                    verifyEmailAndPassword(emailController.text.trim(),
                        passwordController.text.trim());

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const bottombar(
                    //       selectedCity: '',
                    //     ),
                    //   ),
                    // );
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
                        "Login",
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

              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 520, left: 180),
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: Colors.white, // Set text color to black
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 560, left: 65),
                child: ElevatedButton(
                  onPressed: () {
                    signInWithGoogle();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // Set background color to white
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      minimumSize:
                          const Size(240, 40) // Adjust padding as needed
                      ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                        child: SvgPicture.asset(
                          'assets/images/google.svg',
                          color: Colors.green,
                          semanticsLabel: 'Acme Logo',
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        "Login with Google ",
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
              // ignore: prefer_const_constructors
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 620, left: 90),
                  child: Text(
                    "Don't Have an account?SignUp",
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
