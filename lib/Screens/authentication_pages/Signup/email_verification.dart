import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


// class EmailVerificationScreen extends StatefulWidget {
//   const EmailVerificationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EmailVerificationScreen> createState() =>
//       _EmailVerificationScreenState();
// }
//
// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
//   bool isEmailVerified = false;
//   Timer? timer;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     FirebaseAuth.instance.currentUser?.sendEmailVerification();
//     timer =
//         Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
//   }
//
//   checkEmailVerified() async {
//     await FirebaseAuth.instance.currentUser?.reload();
//
//     setState(() {
//       isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });
//
//     if (isEmailVerified) {
//       // TODO: implement your code after email verification
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Email Successfully Verified")));
//       timer?.cancel();
//     }
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 35),
//               const SizedBox(height: 30),
//               const Center(
//                 child: Text(
//                   'Check your \n Email',
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                 child: Center(
//                   child: Text(
//                     // 'We have sent you a Email on  ${auth.currentUser?.email}',
//                     'We have sent you a Email on  ',
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Center(child: CircularProgressIndicator()),
//               const SizedBox(height: 8),
//               const Padding(
//                 padding: EdgeInsets
//                     .symmetric(horizontal: 32.0),
//                 child: Center(
//                   child: Text(
//                     'Verifying email....',
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 57),
//               Padding(
//                 padding: const EdgeInsets
//                     .symmetric(horizontal: 32.0),
//                 child: ElevatedButton(
//                   child: const Text('Resend'),
//                   onPressed: () {
//                     try {
//                       FirebaseAuth.instance.currentUser
//                           ?.sendEmailVerification();
//                     } catch (e) {
//                       debugPrint('$e');
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }