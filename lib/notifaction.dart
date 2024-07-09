import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wardrobe/custom/database.dart';
import 'package:wardrobe/services/firebase_storage_service.dart';
import 'package:wardrobe/services/tryOn_service.dart';
import 'package:wardrobe/tryon_display.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  final FirebaseStorageService firebaseStorageService = FirebaseStorageService();
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Consumer<Database>(
      builder: (context, value, child) {
        return Container(
            // Background Image
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/virtual.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                elevation: 0, // Remove shadow
                centerTitle: true,
                title: const Text(
                  'Virtual Try Room',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    GestureDetector(
                      onTap: () {
                        value.pickImage();
                      },
                      child: Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                            ),
                            color: Colors.purple.withOpacity(0.7),
                          ),
                          child: value.originalImage == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/selectimage.svg'),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Text(
                                      'Select Your Model Image',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                  ),
                                  child: Image.file(
                                    value.originalImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.07
                      ,
                    ),
                    GestureDetector(
                      onTap: () {
                        value.pickDressImage();
                      },
                      child: Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                            ),
                            color:Colors.purple.withOpacity(0.7),
                          ),
                          child: value.dressImage == null
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/selectimage.svg'),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height *
                                      0.02),
                              Text(
                                'Select Your Dress Image',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                              : ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                            ),
                            child: Image.file(
                              value.dressImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.03,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if( value.originalImage != null && value.dressImage !=null) {
                          Map<String,dynamic> imagesUrl = await firebaseStorageService.uploadImages(value.originalImage! ,value.dressImage!);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageEditingScreen(
                                upperBody: imagesUrl['upperBodyUrl'],
                                lowerBody: imagesUrl['lowerBodyUrl'],
                              ),
                            ),
                          );
                        }
                        else{

                        }
                      },
                        child: Text(
                          'Generate Image',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
