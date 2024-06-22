// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wardrobe/custom/dialogBox.dart';
import 'package:wardrobe/custom/sharedPreferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? spPassword;
  String? spName;
  String? spEmail;
  getData() async {
    spPassword = await getStoredLoginInfo('Password');
    spEmail = await getStoredLoginInfo('Email');
    spName = await getStoredLoginInfo('name');

    nameController.text = spName!;
    emailController.text = spEmail!;
    passwordController.text = spPassword!;
  }

  //for updating data

  Future<void> updateUserData(
      String docId, Map<String, dynamic> newData) async {
    try {
      await FirebaseFirestore.instance
          .collection('User')
          .doc(docId)
          .update(newData);
      print('Document updated successfully');

      SharedPreferences instance = await SharedPreferences.getInstance();
      instance.remove('Email');
      instance.remove('Password');

      instance.remove('name');

      storeLoginInfo('Email', emailController.text.trim());
      storeLoginInfo('Password', passwordController.text.trim());

      storeLoginInfo('name', nameController.text.trim());

      DialogHelper.showAlertDialog(
          context, 'Updated', 'Profile updated successfully', () => null);
    } catch (e) {
      print('Failed to update document: $e');
      DialogHelper.showAlertDialog(
          context, 'Failed', 'Failed to update Profile: $e', () => null);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 157, 62, 173),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  // color: Colors.white38,
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    controller: nameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter Name';
                      }
                      // Additional validation logic can be added here
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Name',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person_2_outlined),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  // color: Colors.white38,
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      }
                      // Additional validation logic can be added here
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Email',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  // color: Colors.white38,
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                      // Additional validation logic can be added here
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Password',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 157, 62, 173),
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () async {
                          String? docId = await getStoredLoginInfo('DocId');
                          Map<String, dynamic> newData = {
                            'name': nameController.text.trim(),
                            'email': emailController.text.trim(),
                            'password': passwordController.text.trim(),
                          };

                          updateUserData(docId!, newData);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 157, 62, 173),
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
