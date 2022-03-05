import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoading {
  static Widget customLoading() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 5,
          color: const Color(0xffefefef),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 20),
                const Text('Loading...', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
