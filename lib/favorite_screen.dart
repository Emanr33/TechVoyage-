import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wardrobe/bottombar.dart';
import 'package:wardrobe/custom/database.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<Database>().getFavorite();
    context.read<Database>().getFavoriteUrl();

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
                    builder: (context) => const bottombar(selectedCity: '')),
              );
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'Favourites',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(onTap: () {}, child: const Icon(Icons.search)),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<Database>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Image.asset('assets/images/fav.jpeg'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                value.brandImg.isEmpty
                    ? const Center(child: Text('Not Added To Favorite Yet'))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: value.brandImg.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // // launchInWebViewOrVC(brandUrl[index]);
                                          // // final websiteUrl = Uri.parse(brandUrl[index]);

                                          String url = value.brandUrl[index];
                                          print('.......$url');
                                          final websiteUrl =
                                              Uri.parse('https://$url');
                                          launchUrl(websiteUrl,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            color: Colors.white,
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.18,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Image.asset(
                                              value.brandImg[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 5,
                                        child: GestureDetector(
                                          onTap: () {
                                            value.brandImg.removeAt(index);
                                            value.brandUrl.removeAt(index);

                                            value.removeFavoriteAtIndex(index);
                                            value.removeFavoriteUrlAtIndex(
                                                index);
                                          },
                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.account_balance),
                                      Icon(Icons.shopping_bag_outlined),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
