import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required Map<String, dynamic>? userData,
  }) : _userData = userData;

  final Map<String, dynamic>? _userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(
          horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 2.0,
            spreadRadius: 2.0,
            offset: const Offset(
              5.0,
              5.0,
            ),
          )
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: _userData!['photoURL'],
                    width: 90.0,
                    height: 90.0,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_userData!['name'],style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 10,),
                  Text(_userData!['email']),
                  const SizedBox(height: 10,),
                  Text(_userData!['phone']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}