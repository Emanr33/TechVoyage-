// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wardrobe/bottombar.dart';
import 'package:wardrobe/custom/custom.dart';
import 'package:wardrobe/login_screen.dart';
import 'package:wardrobe/signup_screen.dart';
import 'package:wardrobe/staticData.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
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
          image: AssetImage('assets/images/sigin.jpg'),
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
                              builder: (context) => const SignupScreen()));
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
                    top: MediaQuery.of(context).size.height * 0.14, right: 90),
                child: Center(child: customTextbold(data: 'Wardrobe')),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.22, right: 90),
                child: Center(child: customTextbold(data: 'Wonders')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400, left: 65),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
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
                        "Sign In",
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
                padding: const EdgeInsets.only(top: 470, left: 65),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
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
                        Icons.email,
                        color: Colors.black, // Set icon color to black
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "Sign Up with Email",
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
                padding: const EdgeInsets.only(top: 540, left: 65),
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
            ],
          ),
        ),
      ),
    );
  }
}
