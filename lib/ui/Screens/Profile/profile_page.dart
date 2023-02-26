import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_everyday/utils/message.dart';
import '../../theme/colors.dart';
import 'components/Gereral_section.dart';
import 'components/feedback_section.dart';
import 'components/logout.dart';
import 'components/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _getUserData();
  }

  Future<void> _getUserData() async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('usersInformation').doc(_user!.uid).get();

    if (snapshot.exists) {
      setState(() {
        _userData = snapshot.data();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: _userData != null
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Name: ${_userData!['name']}'),
                          Text('Email: ${_userData!['email']}'),
                          // display other user data here
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Gereral".toUpperCase(),
                          style: const TextStyle(
                              color: primaryColor,
                              letterSpacing: 5,
                              fontWeight: FontWeight.w400,
                              fontSize: 25),
                        ),
                      ),
                      GeneralMenuList(),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "feedback".toUpperCase(),
                          style: const TextStyle(
                              color: primaryColor,
                              letterSpacing: 5,
                              fontWeight: FontWeight.w400,
                              fontSize: 25),
                        ),
                      ),
                      FeedbackMenuList(),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "logout".toUpperCase(),
                          style: const TextStyle(
                              color: primaryColor,
                              letterSpacing: 5,
                              fontWeight: FontWeight.w400,
                              fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const LogoutButton()
                    ],
                  ),
                )
              : Center(child: MessageDialog().progressIndicator(context),),
        ),
      ),
    );
  }
}
