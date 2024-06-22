import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeLoginInfo(String key, String credential) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, credential);
  print('$key stored successfully');
}

Future<String?> getStoredLoginInfo(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

//for favorite

Future<void> addToFavorites(
    BuildContext context, String brandName, String brandImage) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> storedBrandNames =
      prefs.getStringList('favorite_brands_name') ?? [];
  List<String> storedBrandImages =
      prefs.getStringList('favorite_brands_image') ?? [];

  if (storedBrandNames.contains(brandName)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('$brandName is already in favorites'),
        duration: const Duration(seconds: 2),
      ),
    );
  } else {
    storedBrandNames.add(brandName);
    storedBrandImages.add(brandImage);
    await prefs.setStringList('favorite_brands_name', storedBrandNames);
    await prefs.setStringList('favorite_brands_image', storedBrandImages);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('$brandName is added in favorites'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

//for getting data

Future<List<String>?> getFavoriteBrands(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? data = prefs.getStringList(key);

  debugPrint(data as String?);
  return data;
}
