import 'package:flutter/material.dart';
import 'package:wardrobe/bottombar.dart';
import 'package:wardrobe/custom/custom.dart';
import 'package:wardrobe/boarding_screen.dart';
import 'package:wardrobe/custom/sharedPreferences.dart';

class splash2_screen extends StatefulWidget {
  const splash2_screen({super.key});

  @override
  State<splash2_screen> createState() => _splash2_screenState();
}

class _splash2_screenState extends State<splash2_screen> {
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
          image: AssetImage('assets/images/splash.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Center(child: customTextbold(data: 'Wardrobe')),
              Center(child: customTextbold(data: 'Wonders')),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(child: customText(data: 'Explore the new')),
              ),
              Center(child: customText(data: 'World of Clothing')),
              SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    print(spPassword);
                    // return;

                    if (spPassword == null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BoardingScreen()));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const bottombar(
                            selectedCity: '',
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // Set background color to white
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      minimumSize:
                          const Size(220, 50) // Adjust padding as needed
                      ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Let's Explore",
                        style: TextStyle(
                          color: Colors.black, // Set text color to black
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 8.0), // Add spacing between text and icon
                      Icon(
                        Icons.fast_forward_sharp,
                        color: Colors.black, // Set icon color to black
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
