// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wardrobe/bottombar.dart';
import 'package:wardrobe/custom/brand.dart';
import 'package:wardrobe/custom/database.dart';

class BrandsScreen extends StatefulWidget {
  final String selectedCity;
  final String catName;
  final List<String> brandNames;
  final List<String> brandImages;
  final List<String> brandUrl;
  BrandsScreen(
      {super.key,
      required this.selectedCity,
      required this.catName,
      required this.brandNames,
      required this.brandImages,
      required this.brandUrl});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  final TextEditingController searchController = TextEditingController();

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
    for (int i = 0; i < widget.brandNames.length; i++) {
      Brands brand = Brands(
        Brands_name: widget.brandNames[i],
        Brands_image: widget.brandImages[i],
        Brands_url: widget.brandUrl[i],
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
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => bottombar(
                  selectedCity: '',
                ),
              ));
          return false;
        },
        child: Scaffold(
          key: key,
          backgroundColor: Colors.deepPurple,
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 157, 62, 173),
            elevation: 0,
            centerTitle: true,
            title: Text(
              widget.catName,
              style: const TextStyle(
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
                                          dbclass.addToFavoritesUrl(
                                            context,
                                            brand[index].Brands_url,
                                          );
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
