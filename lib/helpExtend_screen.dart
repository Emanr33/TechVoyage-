import 'package:flutter/material.dart';
import 'package:wardrobe/helpAndSupport_screen.dart';

class HelpExtend extends StatefulWidget {
  const HelpExtend({super.key, required this.title});
  final String title;
  @override
  State<HelpExtend> createState() => _HelpExtendState();
}

class _HelpExtendState extends State<HelpExtend> {
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
                    builder: (context) => const HelpAndSupport()),
              );
            },
            child: const Icon(Icons.arrow_back)),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              widget.title == 'Terms And Conditions'
                  ? const Text(
                      'Before you dive into the world of Wardrobe Wonders, familiarize yourself with our Terms and Conditions. These guidelines create a foundation for a positive and enjoyable community where fashion knows no bounds. Join us in celebrating the nation\'s best clothing brands, all within the stylish realm of Wardrobe Wonders.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                  : widget.title == 'About Us'
                      ? const Text(
                          'Welcome to "Wardrobe Wonders" – your go-to destination for nationwide fashion excellence.We unite diverse clothing brands on one platform, offering you a curated blend of the latest trends and timeless styles. At Wardrobe Wonders, we celebrate the beauty of individuality in fashion.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )
                      : const Text(
                          'At Wardrobe Wonders, your privacy is paramount. Our Privacy Policy ensures that your personal information is handled with the utmost care and transparency. Trust us to protect your data as you explore and shop within our app.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
