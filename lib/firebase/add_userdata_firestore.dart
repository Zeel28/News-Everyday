// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AddUserData extends StatelessWidget {
//
//   var fullName;
//   var email;
//   var emailVerified;
//   var phoneNumber;
//   var photoURL;
//   var providerId;
//   var uid;
//
//   AddUserData(
//       {Key? key, required this.fullName, required this.email, required this.emailVerified, required this.phoneNumber, required this.photoURL, required this.providerId, required this.uid})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection(
//         'usersInformation');
//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//         'full_name': fullName,
//         'email': email,
//         'emailVerified': emailVerified,
//         'phoneNumber': phoneNumber,
//         'photoURL': photoURL,
//         'providerId': providerId,
//         'uid': uid
//       })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//     return addUser();
//   }
// }
//
// class AddUser extends StatelessWidget {
//   final String fullName;
//   final String company;
//   final int age;
//
//   AddUser(required this.fullName, this.company, this.age);
//
//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//         'full_name': fullName, // John Doe
//         'company': company, // Stokes and Sons
//         'age': age // 42
//       })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//
//     return TextButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
// }