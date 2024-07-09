// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wardrobe/boarding_screen.dart';
import 'package:wardrobe/helpAndSupport_screen.dart';
import 'package:wardrobe/main_Screen/brands_screen.dart';
import 'package:wardrobe/referFreind_screen.dart';
import 'package:wardrobe/services/tryOn_service.dart';
import 'package:wardrobe/setting_screen.dart';
import 'package:wardrobe/staticData.dart';

class FirstScreen extends StatefulWidget {
  final String selectedCity;
  FirstScreen({super.key, required this.selectedCity});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController searchController = TextEditingController();

  //for categories
  List<String> catName = [
    'Bridal Wear',
    'Formal Events',
    'Casual Outings',
    'Athletic Wear',
    'Eastern Wear',
    'Western Wear',
  ];
  List<String> catImages = [
    'assets/images/bridal_wear.png',
    'assets/images/formal_events.png',
    'assets/images/casual_outings.png',
    'assets/images/athletic_wear.png',
    'assets/images/eastern_wear.png',
    'assets/images/western_wear.png',
  ];
  //for bridal wear
  List<String> bridalName = [
    'Batik studio',
    'Naqshi',
    'HSY',
    'MNR',
    'Mohsin Sons',
    'Republic Womenswear',
    'Ahmad Sultan',
    'Asim Jofa',
    'Mayapret',
    'Mona Embroidery',
    'Jeem',
    'Kashees Boutique',
    'Saira Shakira',
    'Maha Wajahat',
    'Waqas Shah',
    'Tayab Moazzam Studio',
    'Fairy Tale',
    'Faiza Saqlain',
    'Shazia Kiyani',
    'Mina Kashif',
    'Saadibrahimstudio',
    'Imroziapremium',
    'LAMA',
    'Erumkhancouture',
    'Elan',
  ];
  List<String> bridalUrl = [
    'www.batik.com.pk',
    'www.naqshiofficial.com',
    'www.theworldofhsy.com',
    'www.mohsinnaveedranjha.com',
    'www.mohsinsons.com.pk',
    'www.republicwomenswear.com',
    'ahmadsultaan.com',
    'www.asimjofa.com',
    'www.mayapret.com',
    'monaembroidery.com',
    'www.jeem.pk',
    'kasheesstore.com',
    'www.sairashakira.com',
    'www.mahawajahatkhan.com',
    'www.waqasshahofficial.com',
    'www.tayabmoazzamstudio.com',
    'www.fairytale.pl',
    'www.faizasaqlain.pk',
    'www.shaziakiyanistudio.com',
    'www.minakashif.com',
    'saadibrahimstudio.com',
    'imroziapremium.com',
    'lamaretail.com',
    'www.erumkhanstores.com',
    'elan.pk',
  ];
  List<String> bridalImage = [
    'assets/images/13.png',
    'assets/images/6.jpg',
    'assets/images/11.png',
    'assets/images/7.png',
    'assets/images/29.png',
    'assets/images/30.png',
    'assets/images/74.png',
    'assets/images/28.png',
    'assets/images/37.png',
    'assets/images/53.png',
    'assets/images/58.png',
    'assets/images/63.png',
    'assets/images/62.png',
    'assets/images/67.png',
    'assets/images/68.png',
    'assets/images/70.png',
    'assets/images/71.png',
    'assets/images/73.png',
    'assets/images/75.png',
    'assets/images/76.png',
    'assets/images/77.png',
    'assets/images/78.png',
    'assets/images/79.png',
    'assets/images/80.png',
    'assets/images/33.png',
  ];
//formal events

  List<String> formalName = [
    'Lawrencepur',
    'Royal Tag',
    'LAMA',
    'Generation',
    'Ideas',
    'J.',
    'Bareeze',
    'Edenrobe',
    'Mango',
  ];
  List<String> formalUrl = [
    'www.lawrencepur.com',
    'www.royaltag.com.pk',
    'lamaretail.com',
    'generation.com.pk/collections/new-in',
    'www.gulahmedshop.com/ideas-pret',
    'www.junaidjamshed.com',
    'www.bareeze.com',
    'linktr.ee/edenrobe',
    'shop.mango.com',
  ];
  List<String> formalImage = [
    'assets/images/51.png',
    'assets/images/60.png',
    'assets/images/79.png',
    'assets/images/25.png',
    'assets/images/15.jpg',
    'assets/images/4.png',
    'assets/images/24.png',
    'assets/images/10.png',
    'assets/images/41.png',
  ];
  // Casual outings
  List<String> casualName = [
    'Khaadi',
    'Limelight',
    'Sanasafinaz',
    'J.',
    'Ethnic',
    'Almas',
    'Bonanza Satrangi',
    'Edenrobe',
    'Omal By Komal',
    'URGE',
    'Ideas',
    'Mkwears',
    'Nishatlinen',
    'By the way',
    'Beechtree',
    'SAYA',
    'Sapphire',
    'Sha Posh',
    'Generation',
    'Alkaram studio',
    'Maria.B',
    'Bareeze',
    'Kayseria',
    'Cross Stitched',
    'Hussain Rehar',
    'Sobia Nazir',
    'Zara Shahjahan',
    'Qalamkar',
    'Mushq',
    'QUIZ',
    'Mango',
    'Rang Ja',
    'Almirah',
    'SOHAYE Diners',
    'Chinyere',
    'EGO',
    'Charizma',
    'Brands just Pret',
    'Zara Aliz',
    'Lawrencepur',
    'Artimmix',
    'Mona Embroidery',
    'M by Mahira',
    'Jeem',
    'Nakoosh',
    'Motifz',
    'Agha Hassan',
    'mysie by tahira',
    'Fplounge',
    'Waqas Shah',
    'Sarwar jaan',
    'Fairy Tale',
    'Tana Bana',
    'Saadibrahimstudio',
    'Imroziapremium',
    'LAMA',
    'Zeen',
    'dhanak',
  ];
  List<String> casualImage = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
    'assets/images/12.jpg',
    'assets/images/14.png',
    'assets/images/15.jpg',
    'assets/images/17.png',
    'assets/images/18.png',
    'assets/images/19.png',
    'assets/images/21.png',
    'assets/images/38.png',
    'assets/images/81.png',
    'assets/images/82.png',
    'assets/images/25.png',
    'assets/images/22.png',
    'assets/images/23.png',
    'assets/images/24.png',
    'assets/images/26.png',
    'assets/images/27.png',
    'assets/images/31.png',
    'assets/images/32.png',
    'assets/images/34.png',
    'assets/images/35.png',
    'assets/images/36.png',
    'assets/images/40.png',
    'assets/images/41.png',
    'assets/images/42.png',
    'assets/images/43.png',
    'assets/images/45.png',
    'assets/images/46.png',
    'assets/images/47.png',
    'assets/images/48.png',
    'assets/images/49.png',
    'assets/images/50.png',
    'assets/images/51.png',
    'assets/images/52.png',
    'assets/images/53.png',
    'assets/images/55.png',
    'assets/images/58.png',
    'assets/images/59.png',
    'assets/images/61.png',
    'assets/images/64.png',
    'assets/images/65.png',
    'assets/images/66.png',
    'assets/images/68.png',
    'assets/images/69.png',
    'assets/images/71.png',
    'assets/images/72.png',
    'assets/images/77.png',
    'assets/images/78.png',
    'assets/images/79.png',
    'assets/images/83.png',
    'assets/images/39.png',
  ];
  List<String> casualUrl = [
    'www.khaadi.com',
    'www.limelight.pk',
    'Sanasafinaz.com/pk',
    'www.junaidjamshed.com',
    'www.ethnic.pk',
    'www.almas.pk',
    'bonanzasatrangi.com',
    'linktr.ee/edenrobe',
    'www.omalbykomal.com',
    'www.urge.pk',
    'www.gulahmedshop.com/ideas-pret',
    'mkwears.com',
    'Nishatlinen.com',
    'wapo.st/btwbio',
    'www.beechtree.pk',
    'www.saya.pk',
    'Unstitched & Pret Women\'s Clothing – SapphireOnline Store',
    'www.shaposh.pk',
    'generation.com.pk/collections/new-in',
    'Bitly.ws/ugMj',
    'Linktr.ee/mariab.pk',
    'www.bareeze.com',
    'www.kayseria.com',
    'www.crossstitch.pk',
    'www.hussainrehar.com',
    'www.sobianazir.net',
    'Zarashahjahan.com',
    'www.qalamkar.com.pk',
    'mushq.pk',
    'www.quizclothing.pk',
    'shop.mango.com',
    'www.myrangja.com',
    'www.almirah.com.pk',
    'www.sohaye.com',
    'www.chinyere.pk',
    'www.wearego.com',
    'www.houseofcharizma.com',
    'www.brandsjustpretpakistan.com',
    'www.zaraaliz.com',
    'www.lawrencepur.com',
    'artimmix.com',
    'monaembroidery.com',
    'mbymahira.com',
    'www.jeem.pk',
    'www.nakoosh.com',
    'www.motifz.com.pk',
    'aghahassan.com',
    'www.mysiebytahira.com',
    'bit.ly/FPLShop',
    'www.waqasshahofficial.com',
    'www.sarwarjaan.store',
    'www.fairytale.pl',
    'www.tanabana.pk',
    'saadibrahimstudio.com',
    'imroziapremium.com',
    'lamaretail.com',
    'Zeenwomen.com',
    'www.dhanak.com.pk',
  ];
// Athletic wear
  List<String> athleticName = [
    'NIKE',
    'PUMA',
    'ADIDAS',
    'POLO',
  ];
  List<String> athleticImage = [
    'assets/images/84.png',
    'assets/images/85.png',
    'assets/images/86.png',
    'assets/images/87.png',
  ];
  List<String> athleticUrl = [
    'www.nike.com',
    'us.puma.com',
    'www.adidas.co.in',
    'www.ralphlauren.com',
  ];

  //western wear
  List<String> westernName = [
    'Ideas',
    'Breakout',
    'Levi’s',
    'One',
    'Minnie Minors',
    'COUGAR',
    'FUROR',
    'Royal Tag',
    'NIKE',
    'ADIDAS',
    'POLO',
    'PUMA',
    'Mango',
    'Outfitters',
  ];
  List<String> westernImage = [
    'assets/images/15.jpg',
    'assets/images/16.png',
    'assets/images/88.png',
    'assets/images/89.png',
    'assets/images/44.png',
    'assets/images/54.png',
    'assets/images/57.png',
    'assets/images/60.png',
    'assets/images/84.png',
    'assets/images/86.png',
    'assets/images/87.png',
    'assets/images/85.png',
    'assets/images/41.png',
    'assets/images/20.png',
  ];
  List<String> westernUrl = [
    'www.gulahmedshop.com/ideas-pret',
    'www.breakout.com.pk',
    'www.levi.com',
    'www.beoneshopone.com',
    'www.minniwminors.com',
    'www.cougar.com.pk',
    'linktr.ee/furorjeans',
    'www.royaltag.com.pk',
    'www.nike.com',
    'www.adidas.co.in',
    'www.ralphlauren.com',
    'us.puma.com',
    'shop.mango.com',
    'outfitters.com.pk',
  ];

//Eastern wear
  List<String> easternName = [
    'Khaadi',
    'Limelight',
    'Sanasafinaz',
    'J.',
    'Ethnic',
    'Almas',
    'Bonanza Satrangi',
    'Edenrobe',
    'Omal By Komal',
    'URGE',
    'Ideas',
    'Mkwears',
    'Nishatlinen',
    'By the way',
    'Beechtree',
    'SAYA',
    'Sapphire',
    'Sha Posh',
    'Generation',
    'Elan',
    'Alkaram studio',
    'Maria.B',
    'Bareeze',
    'Kayseria',
    'Cross Stitched',
    'Hussain Rehar',
    'Sobia Nazir',
    'Zara Shahjahan',
    'Qalamkar',
    'Mushq',
    'QUIZ',
    'Rang Ja',
    'Almirah',
    'SOHAYE Diners',
    'Chinyere',
    'EGO',
    'Charizma',
    'Brands just Pret',
    'Zara Aliz',
    'Lawrencepur',
    'Artimmix',
    'Mona Embroidery',
    'M by Mahira',
    'Jeem',
    'Nakoosh',
    'Motifz',
    'Agha Hassan',
    'mysie by tahira',
    'Fplounge',
    'Waqas Shah',
    'Sarwar jaan',
    'Fairy Tale',
    'Tana Bana',
    'Saadibrahimstudio',
    'Imroziapremium',
    'LAMA',
    'Zeen',
    'Idea',
    'Breakout',
    'PUMA',
    'Batik studio',
    'Naqshi',
    'HSY',
    'MNR',
    'Mohsin Sons',
    'Republic Womenswear',
    'Ahmad Sultan',
    'Asim Jofa',
    'Mayapret',
    'Mona Embroidery',
    'Jeem',
    'Kashees Boutique',
    'Saira Shakira',
    'Maha Wajahat',
    'Tayab Moazzam Studio',
    'Faiza Saqlain',
    'Shazia Kiyani',
    'Mina Kashif',
    'Erumkhancouture',
  ];
  List<String> easternUrl = [
    'www.khaadi.com',
    'www.limelight.pk',
    'Sanasafinaz.com/pk',
    'www.junaidjamshed.com',
    'www.ethnic.pk',
    'www.almas.pk',
    'bonanzasatrangi.com',
    'linktr.ee/edenrobe',
    'www.omalbykomal.com',
    'www.urge.pk',
    'www.gulahmedshop.com/ideas-pret',
    'mkwears.com',
    'Nishatlinen.com',
    'wapo.st/btwbio',
    'www.beechtree.pk',
    'www.saya.pk',
    'Unstitched & Pret Women\'s Clothing – SapphireOnline Store',
    'www.shaposh.pk',
    'generation.com.pk/collections/new-in',
    'elan.pk',
    'Bitly.ws/ugMj',
    'Linktr.ee/mariab.pk',
    'www.bareeze.com',
    'www.kayseria.com',
    'www.crossstitch.pk',
    'www.hussainrehar.com',
    'www.sobianazir.net',
    'Zarashahjahan.com',
    'www.qalamkar.com.pk',
    'mushq.pk',
    'www.quizclothing.pk',
    'www.myrangja.com',
    'www.almirah.com.pk',
    'www.sohaye.com',
    'www.chinyere.pk',
    'www.wearego.com',
    'www.houseofcharizma.com',
    'www.brandsjustpretpakistan.com',
    'www.zaraaliz.com',
    'www.lawrencepur.com',
    'artimmix.com',
    'monaembroidery.com',
    'mbymahira.com',
    'www.jeem.pk',
    'www.nakoosh.com',
    'www.motifz.com.pk',
    'aghahassan.com',
    'www.mysiebytahira.com',
    'bit.ly/FPLShop',
    'www.waqasshahofficial.com',
    'www.sarwarjaan.store',
    'www.fairytale.pl',
    'www.tanabana.pk',
    'saadibrahimstudio.com',
    'imroziapremium.com',
    'lamaretail.com',
    'Zeenwomen.com',
    'www.gulahmedshop.com/ideas-pret',
    'www.breakout.com.pk',
    'us.puma.com',
    'www.batik.com.pk',
    'www.naqshiofficial.com',
    'www.theworldofhsy.com',
    'www.mohsinnaveedranjha.com',
    'www.mohsinsons.com.pk',
    'www.republicwomenswear.com',
    'ahmadsultaan.com',
    'www.asimjofa.com',
    'www.mayapret.com',
    'monaembroidery.com',
    'www.jeem.pk',
    'kasheesstore.com',
    'www.sairashakira.com',
    'www.mahawajahatkhan.com',
    'www.tayabmoazzamstudio.com',
    'www.faizasaqlain.pk',
    'www.shaziakiyanistudio.com',
    'www.minakashif.com',
    'www.erumkhanstores.com',
  ];
  List<String> easternImage = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
    'assets/images/12.jpg',
    'assets/images/14.png',
    'assets/images/15.jpg',
    'assets/images/17.png',
    'assets/images/18.png',
    'assets/images/19.png',
    'assets/images/21.png',
    'assets/images/38.png',
    'assets/images/81.png',
    'assets/images/82.png',
    'assets/images/25.png',
    'assets/images/33.png',
    'assets/images/22.png',
    'assets/images/23.png',
    'assets/images/24.png',
    'assets/images/26.png',
    'assets/images/27.png',
    'assets/images/31.png',
    'assets/images/32.png',
    'assets/images/34.png',
    'assets/images/35.png',
    'assets/images/36.png',
    'assets/images/40.png',
    'assets/images/42.png',
    'assets/images/43.png',
    'assets/images/45.png',
    'assets/images/46.png',
    'assets/images/47.png',
    'assets/images/48.png',
    'assets/images/49.png',
    'assets/images/50.png',
    'assets/images/51.png',
    'assets/images/52.png',
    'assets/images/53.png',
    'assets/images/55.png',
    'assets/images/58.png',
    'assets/images/59.png',
    'assets/images/61.png',
    'assets/images/64.png',
    'assets/images/65.png',
    'assets/images/66.png',
    'assets/images/68.png',
    'assets/images/69.png',
    'assets/images/71.png',
    'assets/images/72.png',
    'assets/images/77.png',
    'assets/images/78.png',
    'assets/images/79.png',
    'assets/images/83.png',
    'assets/images/15.jpg',
    'assets/images/16.png',
    'assets/images/85.png',
    'assets/images/13.png',
    'assets/images/6.jpg',
    'assets/images/11.png',
    'assets/images/7.png',
    'assets/images/29.png',
    'assets/images/30.png',
    'assets/images/74.png',
    'assets/images/28.png',
    'assets/images/37.png',
    'assets/images/53.png',
    'assets/images/58.png',
    'assets/images/63.png',
    'assets/images/62.png',
    'assets/images/67.png',
    'assets/images/70.png',
    'assets/images/73.png',
    'assets/images/75.png',
    'assets/images/76.png',
    'assets/images/80.png',
  ];
  final ApiService apiService = ApiService();
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

  @override
  void initState() {
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
          // backgroundColor: Colors.deepPurple,
          backgroundColor: Colors.grey.withOpacity(0.7),
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 157, 62, 173),
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Welcome Back!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            actions: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 30.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () async {
                        const String query = "nearest clothing brands outlets";
                        const String googleMapsUrl =
                            "https://www.google.com/maps/search/?api=1&query=$query";
                        if (await canLaunch(googleMapsUrl)) {
                          await launch(googleMapsUrl);
                        } else {
                          throw 'Could not launch Google Maps';
                        }
                      },
                      child: Icon(
                        Icons.location_on_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   alignment: Alignment.centerLeft,
                //   child: const Center(
                //     child: Padding(
                //       padding: EdgeInsets.all(8.0),
                //   child: Text(
                //     'Explore NationWide Brands',
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 20,
                //         color: Colors.white),
                //   ),
                // ),
                //   ),

                // ),
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: GestureDetector(
                //     onTap: () async {
                // const String query =
                //     "nearest clothing brands outlets"; // Your search query here
                // const String googleMapsUrl =
                //     "https://www.google.com/maps/search/?api=1&query=$query";
                // if (await canLaunch(googleMapsUrl)) {
                //   await launch(googleMapsUrl);
                // } else {
                //   throw 'Could not launch Google Maps';
                // }
                //     },
                //     child: Container(
                //       height: MediaQuery.of(context).size.height * 0.07,
                //       width: MediaQuery.of(context).size.width * 0.7,
                //       decoration: BoxDecoration(
                //         color: const Color.fromARGB(255, 188, 113, 201),
                //         borderRadius: BorderRadius.circular(12.0),
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: const [
                //             // SizedBox(
                //             //   height: 30,
                //             //   child: Image.asset(
                //             //       'assets/images/brand_locator.jpeg'),
                //             // ),
                // Icon(
                //   Icons.location_on_sharp,
                //   color: Colors.white,
                // ),
                //             Padding(
                //               padding: EdgeInsets.only(left: 8.0),
                //               child: Text(
                //                 'Brands Locator',
                //                 style: TextStylealra(
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 20,
                //                     color: Colors.white),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                buildImageListView(catName, catImages),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build a horizontal ListView of images

  Widget buildImageListView(List<String> catName, List<String> catImages) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: catName.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (catName[index] == 'Bridal Wear') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BrandsScreen(
                                  selectedCity: '',
                                  catName: 'Bridal Wear',
                                  brandNames: bridalName,
                                  brandImages: bridalImage,
                                  brandUrl: bridalUrl),
                            ),
                          );
                        } else if (catName[index] == 'Formal Events') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BrandsScreen(
                                    selectedCity: '',
                                    catName: 'Formal Events',
                                    brandNames: formalName,
                                    brandImages: formalImage,
                                    brandUrl: formalUrl),
                              ));
                        } else if (catName[index] == 'Casual Outings') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BrandsScreen(
                                    selectedCity: '',
                                    catName: 'Casual Outings',
                                    brandNames: casualName,
                                    brandImages: casualImage,
                                    brandUrl: casualUrl),
                              ));
                        } else if (catName[index] == 'Athletic Wear') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BrandsScreen(
                                    selectedCity: '',
                                    catName: 'Athletic Wear',
                                    brandNames: athleticName,
                                    brandImages: athleticImage,
                                    brandUrl: athleticUrl),
                              ));
                        } else if (catName[index] == 'Western Wear') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BrandsScreen(
                                    selectedCity: '',
                                    catName: 'Western Wear',
                                    brandNames: westernName,
                                    brandImages: westernImage,
                                    brandUrl: westernUrl),
                              ));
                        } else {
                          debugPrint(easternName.length.toString());
                          debugPrint(easternImage.length.toString());
                          debugPrint(easternUrl.length.toString());
                          // return;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BrandsScreen(
                                    selectedCity: '',
                                    catName: 'Eastern Wear',
                                    brandNames: easternName,
                                    brandImages: easternImage,
                                    brandUrl: easternUrl),
                              ));
                        }
                        // launchInWebViewOrVC(brandUrl[index]);
                        // final websiteUrl = Uri.parse(brandUrl[index]);

                        // final websiteUrl =
                        //     Uri.parse('https://$url');
                        // launchUrl(websiteUrl,
                        //     mode: LaunchMode.externalApplication);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            catImages[index],
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        catName[index],
                        style: const TextStyle(
                          color: Colors.white, // Set button text color
                          fontSize: 14, // Set button text size
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
