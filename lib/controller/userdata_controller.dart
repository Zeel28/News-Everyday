import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User _user;
  RxMap<String, dynamic>? userData = RxMap<String, dynamic>({});

  @override
  void onInit() async {
    super.onInit();
    _user = _auth.currentUser!;
    await _getUserData();
  }

  Future<void> _getUserData() async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
    await _firestore.collection('usersInformation').doc(_user.uid).get();

    if (snapshot.exists) {
      userData!.assignAll(snapshot.data()!);
    }
  }
}