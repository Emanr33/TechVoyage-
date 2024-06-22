import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wardrobe/bottombar.dart';
import 'package:wardrobe/helpExtend_screen.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
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
                    builder: (context) => const bottombar(
                          selectedCity: '',
                        )),
              );
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'Help & Support',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // print('Clicked Share Application');
              String title = 'About Us';

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpExtend(
                    title: title,
                  ),
                ),
              );
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color.fromARGB(255, 157, 62, 173),
                  border: Border.all(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.003,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: SvgPicture.asset(
                        'assets/images/about.svg',
                        height: MediaQuery.of(context).size.height * 0.03,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        'About Us',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                  color: Colors.black38,
                                  offset: Offset(-1.5, 1.5),
                                  blurRadius: 4)
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          GestureDetector(
            onTap: () {
              // print('Clicked Share Application');
              String title = 'Privacy Policy';

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpExtend(
                    title: title,
                  ),
                ),
              );
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color.fromARGB(255, 157, 62, 173),
                  border: Border.all(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.003,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: SvgPicture.asset(
                        'assets/images/privacy.svg',
                        height: MediaQuery.of(context).size.height * 0.03,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                  color: Colors.black38,
                                  offset: Offset(-1.5, 1.5),
                                  blurRadius: 4)
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          GestureDetector(
            onTap: () {
              // print('Clicked Share Application');

              String title = 'Terms And Conditions';

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpExtend(
                    title: title,
                  ),
                ),
              );
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color.fromARGB(255, 157, 62, 173),
                  border: Border.all(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.003,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: SvgPicture.asset(
                        'assets/images/report.svg',
                        height: MediaQuery.of(context).size.height * 0.03,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        'Terms And Condtions',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                  color: Colors.black38,
                                  offset: Offset(-1.5, 1.5),
                                  blurRadius: 4)
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
