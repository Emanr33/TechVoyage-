// ignore_for_file: prefer_for_elements_to_map_fromiterable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database extends ChangeNotifier {
  List<String> brandImg = [];
  List<String> brandUrl = [];

  //add to favorite
  Future<void> addToFavorites(
      BuildContext context, String brandName, String brandImage) async {
    brandImg.add(brandImage);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('brand_Image', brandImg);

    debugPrint(prefs.getStringList('brand_Image').toString());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('$brandName is added in favorites'),
        duration: const Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

//get favorite
  void getFavorite() async {
    brandImg.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recents = prefs.getStringList('brand_Image') ?? [];
    if (recents != brandImg) {
      brandImg = recents;
      debugPrint(brandImg.toString());
      notifyListeners();
    }

    notifyListeners();
  }

  // remove from favorite

  Future<void> removeFavoriteAtIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the existing list from SharedPreferences
    List<String> recents = prefs.getStringList('brand_Image') ?? [];

    // Check if the index is within the bounds of the list
    if (index >= 0 && index < recents.length) {
      // Remove the item at the specified index
      recents.removeAt(index);

      // Save the updated list back to SharedPreferences
      await prefs.setStringList('brand_Image', recents);

      debugPrint('Data removed at index $index');
    } else {
      debugPrint('Invalid index');
    }
    notifyListeners();
  }

  //for favorite brands url

  Future<void> addToFavoritesUrl(BuildContext context, String brandURL) async {
    brandUrl.add(brandURL);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('brand_Url', brandUrl);

    debugPrint(prefs.getStringList('brand_Url').toString());
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     backgroundColor: Colors.green,
    //     content: Text('$brandURL is added in favorites'),
    //     duration: const Duration(seconds: 2),
    //   ),
    // );
    notifyListeners();
  }

  void getFavoriteUrl() async {
    brandUrl.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recents = prefs.getStringList('brand_Url') ?? [];
    if (recents != brandUrl) {
      brandUrl = recents;
      debugPrint(brandUrl.toString());
      notifyListeners();
    }

    notifyListeners();
  }

  Future<void> removeFavoriteUrlAtIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the existing list from SharedPreferences
    List<String> recents = prefs.getStringList('brand_Url') ?? [];

    // Check if the index is within the bounds of the list
    if (index >= 0 && index < recents.length) {
      // Remove the item at the specified index
      recents.removeAt(index);

      // Save the updated list back to SharedPreferences
      await prefs.setStringList('brand_Url', recents);

      debugPrint('Data removed at index $index');
    } else {
      debugPrint('Invalid index');
    }
    notifyListeners();
  }

  //for rating
  Map<String, double> ratings = {};
  void storeRatings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ratings', ratings.toString());
    notifyListeners();
  }

  void getRatings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? ratingsString = prefs.getString('ratings');
    if (ratingsString != null && ratingsString.isNotEmpty) {
      Map<String, dynamic> ratingsMap = Map.fromIterable(
        ratingsString.substring(1, ratingsString.length - 1).split(', '),
        key: (e) => e.split(': ')[0],
        value: (e) => double.parse(e.split(': ')[1]),
      );

      ratings = Map<String, double>.from(ratingsMap);

      notifyListeners();
    }
    notifyListeners();
  }

  //for image

  //FOR UPDATE DIALOG

  bool showbaner = true;
  hidebannerFun(bool val) {
    showbaner = val;
    notifyListeners();
  }

  File? originalImage;
  File? dressImage;
  String? dressSize;
  String? originalSize;
  File? compressDressImage;
  String? compressDressSize;
  File? compressImage;
  String? compressSize;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedFile != null) {
      originalImage = File(pickedFile.path);
      originalSize = null; // Reset the image size

      notifyListeners();

      // Get and set the image size in KB or MB
      final fileSize = await File(pickedFile.path).length();

      if (fileSize < 1024) {
        originalSize = '$fileSize bytes';
      } else if (fileSize < 1024 * 1024) {
        final sizeInKB = (fileSize / 1024).toStringAsFixed(2);
        originalSize = '$sizeInKB KB';
      } else {
        final sizeInMB = (fileSize / (1024 * 1024)).toStringAsFixed(2);
        originalSize = '$sizeInMB MB';
      }
      notifyListeners();
    }
  }
  Future<void> pickDressImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedFile != null) {
      dressImage = File(pickedFile.path);
      dressSize = null; // Reset the image size

      notifyListeners();

      // Get and set the image size in KB or MB
      final fileSize = await File(pickedFile.path).length();

      if (fileSize < 1024) {
        dressSize = '$fileSize bytes';
      } else if (fileSize < 1024 * 1024) {
        final sizeInKB = (fileSize / 1024).toStringAsFixed(2);
        dressSize = '$sizeInKB KB';
      } else {
        final sizeInMB = (fileSize / (1024 * 1024)).toStringAsFixed(2);
        dressSize = '$sizeInMB MB';
      }
      notifyListeners();
    }
  }
}
