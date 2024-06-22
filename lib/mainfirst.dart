// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:wardrobe/boarding_screen.dart';
import 'package:wardrobe/custom/brand.dart';
import 'package:wardrobe/custom/database.dart';

import 'package:wardrobe/helpAndSupport_screen.dart';
import 'package:wardrobe/referFreind_screen.dart';
import 'package:wardrobe/setting_screen.dart';
import 'package:wardrobe/staticData.dart';

class main_first extends StatefulWidget {
  final String selectedCity;
  main_first({super.key, required this.selectedCity});

  @override
  State<main_first> createState() => _main_firstState();
}

class _main_firstState extends State<main_first> {
  final TextEditingController searchController = TextEditingController();

  List<String> brandNames = [
    'Khaadi',
    'Limelight',
    'Sanasafinaz',
    'J.',
    'Ethnic',
    'Naqsi',
    'MNR',
    'Almas',
    'Bonanza Satrangi',
    'Edenrobe',
    'HSY',
    'Omal by Komal',
    'Batik studio',
    'URGE',
    'Ideas',
    'Breakout',
    'mkwears',
    'Nishat linen',
    'By the way',
    'Outfitters',
    'Beechtree',
    'Alkaram studio',
    'Maria.B',
    'Bareeze',
    'Generation',
    'Kayseria',
    'Cross Stitch',
    'Asim Jofa',
    'Mohsin Sons',
    'Republic Womenswear',
    'Hussain Rehar',
    'Sobia Nazir',
    'Elan',
    'Zara Shahjahan',
    'Qalamkar',
    'Mushq',
    'Mayapret',
    'SAYA',
    'Dhanak',
    'QUIZ',
    'Mango',
    'Rang Ja',
    'Almirah',
    'Minnie Minors',
    'SOHAYE Diners',
    'Chinyere',
    'EGO',
    'Charizma',
    'Brands just Pret',
    'Zara ALiz',
    'Lawrencepur',
    'Artimmix',
    'Mona Embroidery',
    'COUGAR',
    'M by Mahira',
    'Sha Posh',
    'FUROR',
    'Jeem',
    'Nakoosh',
    'Royal Tag',
    'Motifz',
    'Saira Shakira',
    'Kashees Bridal Boutique',
    'Agha Hassan',
    'mysie by tahira',
    'Fplounge',
    'Maha Wajahat',
    'Waqas Shah',
    'Sarwar jaan',
    'Tayab Moazzam Studio',
    'Fairy Tale',
    'Tana Bana',
    'Faiza Saqlain',
    'Ahmad Sultan',
    'Shazia Kiyani',
    'Mina Kashif',
    'Saadibrahimstudio',
    'Imroziapremium',
    'LAMA',
    'Erumkhancouture',
  ];

  List<String> brandImages = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.jpg',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
    'assets/images/11.png',
    'assets/images/12.jpg',
    'assets/images/13.png',
    'assets/images/14.png',
    'assets/images/15.jpg',
    'assets/images/16.png',
    'assets/images/17.png',
    'assets/images/18.png',
    'assets/images/19.png',
    'assets/images/20.png',
    'assets/images/21.png',
    'assets/images/22.png',
    'assets/images/23.png',
    'assets/images/24.png',
    'assets/images/25.png',
    'assets/images/26.png',
    'assets/images/27.png',
    'assets/images/28.png',
    'assets/images/29.png',
    'assets/images/30.png',
    'assets/images/31.png',
    'assets/images/32.png',
    'assets/images/33.png',
    'assets/images/34.png',
    'assets/images/35.png',
    'assets/images/36.png',
    'assets/images/37.png',
    'assets/images/38.png',
    'assets/images/39.png',
    'assets/images/40.png',
    'assets/images/41.png',
    'assets/images/42.png',
    'assets/images/43.png',
    'assets/images/44.png',
    'assets/images/45.png',
    'assets/images/46.png',
    'assets/images/47.png',
    'assets/images/48.png',
    'assets/images/49.png',
    'assets/images/50.png',
    'assets/images/51.png',
    'assets/images/52.png',
    'assets/images/53.png',
    'assets/images/54.png',
    'assets/images/55.png',
    'assets/images/56.png',
    'assets/images/57.png',
    'assets/images/58.png',
    'assets/images/59.png',
    'assets/images/60.png',
    'assets/images/61.png',
    'assets/images/62.png',
    'assets/images/63.png',
    'assets/images/64.png',
    'assets/images/65.png',
    'assets/images/66.png',
    'assets/images/67.png',
    'assets/images/68.png',
    'assets/images/69.png',
    'assets/images/70.png',
    'assets/images/71.png',
    'assets/images/72.png',
    'assets/images/73.png',
    'assets/images/74.png',
    'assets/images/75.png',
    'assets/images/76.png',
    'assets/images/77.png',
    'assets/images/78.png',
    'assets/images/79.png',
    'assets/images/80.png',
  ];

  List<String> brandUrl = [
    'www.khaadi.com',
    'www.limelight.pk',
    'Sanasafinaz.com/pk',
    'www.junaidjamshed.com',
    'www.ethnic.pk',
    'www.naqshiofficial.com',
    'www.mohsinnaveedranjha.com',
    'www.almas.pk',
    'bonanzasatrangi.com',
    'linktr.ee/edenrobe',
    'www.theworldofhsy.com',
    'www.omalbykomal.com',
    'www.batik.com.pk',
    'www.urge.pk',
    'www.gulahmedshop.com/ideas-pret',
    'www.breakout.com.pk',
    'mkwears.com',
    'Nishatlinen.com',
    'wapo.st/btwbio',
    'outfitters.com.pk',
    'www.beechtree.pk',
    'Bitly.ws/ugMj',
    'Linktr.ee/mariab.pk',
    'www.bareeze.com',
    'generation.com.pk/collections/new-in',
    'www.kayseria.com',
    'www.crossstitch.pk',
    'www.asimjofa.com',
    'www.mohsinsons.com.pk',
    'www.republicwomenswear.com',
    'www.hussainrehar.com',
    'www.sobianazir.net',
    'elan.pk',
    'Zarashahjahan.com',
    'www.qalamkar.com.pk',
    'mushq.pk',
    'www.mayapret.com',
    'www.saya.pk',
    'www.dhanak.com.pk',
    'www.quizclothing.pk',
    'shop.mango.com',
    'www.myrangja.com',
    'www.almirah.com.pk',
    'www.minniwminors.com',
    'www.sohaye.com',
    'www.chinyere.pk',
    'www.wearego.com',
    'www.houseofcharizma.com',
    'www.brandsjustpretpakistan.com',
    'www.zaraaliz.com',
    'www.lawrencepur.com',
    'artimmix.com',
    'monaembroidery.com',
    'www.cougar.com.pk',
    'mbymahira.com',
    'www.shaposh.pk',
    'linktr.ee/furorjeans',
    'www.jeem.pk',
    'www.nakoosh.com',
    'www.royaltag.com.pk',
    'www.motifz.com.pk',
    'www.sairashakira.com',
    'kasheesstore.com',
    'aghahassan.com',
    'www.mysiebytahira.com',
    'bit.ly/FPLShop',
    'www.mahawajahatkhan.com',
    'www.waqasshahofficial.com',
    'www.sarwarjaan.store',
    'www.tayabmoazzamstudio.com',
    'www.fairytale.pl',
    'www.tanabana.pk',
    'www.faizasaqlain.pk',
    'ahmadsultaan.com',
    'www.shaziakiyanistudio.com',
    'www.minakashif.com',
    'saadibrahimstudio.com',
    'imroziapremium.com',
    'lamaretail.com',
    'www.erumkhanstores.com',
  ];
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  Future<void> launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Brands> brandsList = [];
  getBrand() {
    for (int i = 0; i < brandNames.length; i++) {
      Brands brand = Brands(
        Brands_name: brandNames[i],
        Brands_image: brandImages[i],
        Brands_url: brandUrl[i],
      );
      brandsList.add(brand);
    }
    setState(() {});
  }

// for searching brand//
  int count = 0;
  bool isTyping = false;

  fun(String text) {
    if (text == "") {
      count = 0;
      isTyping = false;
      setState(() {});
    }
    count++;
    isTyping = true;

    searchData(text);

    setState(() {});
  }

  List<Brands> searchedBrands = [];

  void searchData(String text) {
    searchedBrands.clear();

    searchedBrands = brandsList
        .where((item) => item.Brands_name.toLowerCase().contains(text))
        .toList();
    debugPrint(searchedBrands.toString());
    isTyping = true;
    setState(() {});
  }

  @override
  void initState() {
    getBrand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: WillPopScope(
        onWillPop: () async {
          if (key.currentState!.isDrawerOpen) {
            Navigator.of(context).pop();
            return false;
          }
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Adjust the radius here
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Do you want to exit?',
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
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.003,
                              color: Colors.black26,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                exit(0);
                              },
                              child: Text(
                                'Exit',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
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
          return false;
        },
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 157, 62, 173),
                  ),
                  child: Center(
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Data.myAccount = true;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BoardingScreen()),
                    );
                    // Add your logic here for Drawer Item 1
                  },
                ),

                const Divider(),
                ListTile(
                  title: const Text(
                    'Refer a Friend',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReferFrind()),
                    );
                    // Add your logic here for Drawer Item 2
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingScreen()),
                    );
                    // Add your logic here for Drawer Item 3
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    'Help',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpAndSupport()),
                    );
                    // Add your logic here for Drawer Item 4
                  },
                ),
                // Add more ListTile widgets for additional items if needed
              ],
            ),
          ),
          key: key,
          backgroundColor: Colors.deepPurple,
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 157, 62, 173),
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Welcome Back!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildImageListView(brandsList),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build a horizontal ListView of images

  Widget buildImageListView(List<Brands> brand) {
    var dbclass = context.read<Database>();

    context.read<Database>();
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Explore NationWide Brands',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),

              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 8.0, bottom: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (txt) {
                      fun(txt);
                      debugPrint('is Typing:$isTyping');
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search for Brands',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                      iconColor: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            isTyping == false && count == 0
                ? Consumer<Database>(
                    builder: (context, value, child) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: brand.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // launchInWebViewOrVC(brandUrl[index]);
                                      // final websiteUrl = Uri.parse(brandUrl[index]);

                                      String url = brand[index].Brands_url;
                                      print('.......$url');
                                      final websiteUrl =
                                          Uri.parse('https://$url');
                                      launchUrl(websiteUrl,
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Colors.white,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.asset(
                                          brand[index].Brands_image,
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: () {
                                        debugPrint('Click');
                                        debugPrint(brand[index].Brands_name);
                                        debugPrint(brand[index].Brands_image);

                                        String favorite =
                                            brand[index].Brands_image;
                                        print(favorite);

                                        if (!dbclass.brandImg
                                            .contains(favorite)) {
                                          dbclass.addToFavorites(
                                              context,
                                              brand[index].Brands_name,
                                              brand[index].Brands_image);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  '${brand[index].Brands_name} is already in favorites'),
                                              duration:
                                                  const Duration(seconds: 2),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  brand[index].Brands_name,
                                  style: const TextStyle(
                                    color:
                                        Colors.white, // Set button text color
                                    fontSize: 14, // Set button text size
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  )
                : Consumer<Database>(
                    builder: (context, value, child) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: searchedBrands.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      String url =
                                          searchedBrands[index].Brands_url;
                                      print('.......$url');
                                      final websiteUrl =
                                          Uri.parse('https://$url');
                                      launchUrl(websiteUrl,
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Colors.white,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.asset(
                                          searchedBrands[index].Brands_image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: () {
                                        debugPrint('Click');
                                        debugPrint(
                                            searchedBrands[index].Brands_name);
                                        debugPrint(
                                            searchedBrands[index].Brands_image);

                                        String favorite =
                                            searchedBrands[index].Brands_image;
                                        print(favorite);

                                        if (!dbclass.brandImg
                                            .contains(favorite)) {
                                          dbclass.addToFavorites(
                                              context,
                                              searchedBrands[index].Brands_name,
                                              searchedBrands[index]
                                                  .Brands_image);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  '${searchedBrands[index].Brands_name} is already in favorites'),
                                              duration:
                                                  const Duration(seconds: 2),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  searchedBrands[index].Brands_name,
                                  style: const TextStyle(
                                    color:
                                        Colors.white, // Set button text color
                                    fontSize: 14, // Set button text size
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
