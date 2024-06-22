import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wardrobe/bottombar.dart';
import 'package:wardrobe/changePassword_screen.dart';
import 'package:wardrobe/custom/dialogBox.dart';
import 'package:wardrobe/custom/sharedPreferences.dart';
import 'package:wardrobe/editProfile_screen.dart';
import 'package:wardrobe/login_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notification = true;
  bool update = false;

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
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 157, 62, 173),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  // builder: (context) => const DrawerContent()),
                  builder: (context) => const bottombar(selectedCity: ''),
                ),
              );
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'Setting',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              GestureDetector(
                onTap: () {
                  if (spPassword == null) {
                    DialogHelper.showAlertDialog(context, 'Login First',
                        'Can\'t edit profile', () => null);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfile(),
                        ));
                  }
                },
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              GestureDetector(
                onTap: () {
                  if (spPassword == null) {
                    DialogHelper.showAlertDialog(context, 'Login First',
                        'Can\'t update password ', () => null);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePassword(),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Change Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              GestureDetector(
                onTap: () {
                  if (spPassword == null) {
                    DialogHelper.showAlertDialog(context, 'Login First',
                        'Didn\'t Login Yet', () => null);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust the radius here
                          ),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Do you want to logout?',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            Column(
                              children: [
                                const Divider(
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.003,
                                        color: Colors.black26,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          Navigator.of(context).pop();
                                          SharedPreferences instance =
                                              await SharedPreferences
                                                  .getInstance();
                                          instance.remove('Email');
                                          instance.remove('Password');
                                          instance.remove('name');
                                          instance.remove('DocId');
                                          instance.remove('ratings');
                                          instance.remove('brand_Image');

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Logout',
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Notification',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notification',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Switch(
                      trackColor: notification
                          ? MaterialStateProperty.all(Colors.black12)
                          : MaterialStateProperty.all(Colors.white),
                      activeColor: Colors.blue,
                      inactiveThumbColor: const Color.fromARGB(210, 95, 87, 87),
                      value: notification,
                      onChanged: (value) {
                        setState(() {
                          notification = value;
                        });
                      }),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       'Updates',
              //       style: TextStyle(
              //         fontWeight: FontWeight.w600,
              //         color: Colors.black,
              //         fontSize: 18,
              //       ),
              //     ),
              //     Switch(
              //         trackColor: update
              //             ? MaterialStateProperty.all(Colors.black12)
              //             : MaterialStateProperty.all(Colors.white),
              //         activeColor: Colors.blue,
              //         inactiveThumbColor: const Color.fromARGB(210, 95, 87, 87),
              //         value: update,
              //         onChanged: (value) {
              //           setState(() {
              //             update = value;
              //           });
              //         }),
              //   ],
              // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Other',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Language',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 238, 228, 228)),
                    child: const Center(
                      child: Text(
                        'English',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Region',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 238, 228, 228)),
                    child: const Center(
                      child: Text(
                        'Pakistan',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
