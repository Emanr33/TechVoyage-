// ignore_for_file: prefer_for_elements_to_map_fromiterable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'package:wardrobe/custom/rating.dart';
import 'package:wardrobe/custom/database.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
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

  @override
  void initState() {
    // getRatings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<Database>().getRatings();
    return Container(
      // Background Image
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sigin.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Consumer<Database>(builder: (context, value, child) {
          List<RatingBrand> brands = brandNames.map((name) {
            return RatingBrand(
              name: name,
              imagePath: brandImages[brandNames.indexOf(name)],
              rating: value.ratings[name] ?? 0,
            );
          }).toList();

          brands.sort((a, b) => b.rating.compareTo(a.rating));
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              const Center(
                child: Text(
                  'Rating',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0, top: 30.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      // color: const Color(0XFF008774),
                      color: const Color.fromARGB(255, 157, 62, 173),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Rate your go-to brand!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      brands[index].imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  brands[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: brands[index].rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 10,
                                  ),
                                  onRatingUpdate: (rating) {
                                    setState(() {
                                      brands[index].rating = rating;
                                    });
                                    value.ratings[brands[index].name] = rating;
                                    value.storeRatings();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        })),
      ),
    );
  }
}
