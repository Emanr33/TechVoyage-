import 'package:flutter/material.dart';
import 'package:wardrobe/bottombar.dart';

class region_screen extends StatefulWidget {
  const region_screen({super.key});

  @override
  State<region_screen> createState() => _region_screenState();
}

class _region_screenState extends State<region_screen> {
  final List<String> cities = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Rawalpindi',
    'Multan',
    'Faisalabad',
    'Peshawar',
    'Quetta',
    'Sialkot',
    'Gujranwala',
    'Abbottabad',
    'Bahawalpur',
    'Sargodha',
    'Sukkur',
    'Jhang',
    'Sheikhupura',
    'Rahim Yar Khan',
    'Mardan',
    'Kasur',
    'Dera Ghazi Khan',
    // Add more cities as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background Image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/region.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Image.asset('assets/images/splash2.png'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showCitySelectionDialog();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      minimumSize: const Size(220, 50)),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Select Your Region",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Icon(
                        Icons.fast_forward_sharp,
                        color: Colors.black,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showCitySelectionDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Your City'),
          content: SingleChildScrollView(
            child: Column(
              children: cities.map((city) {
                return ListTile(
                  title: Text(city),
                  onTap: () {
                    Navigator.of(context)
                        .pop(); // Close the dialog when a city is tapped
                    _navigateToNextScreen(city); // Navigate to next screen
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _navigateToNextScreen(String selectedCity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => bottombar(selectedCity: selectedCity),
      ),
    );
  }
}
