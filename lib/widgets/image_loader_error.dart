import 'package:flutter/material.dart';

class ImageLoaderError {
  static Widget loading({size = 60.0}) {
    return  SizedBox(
      height: size,
      child: const Center(
        child:  CircularProgressIndicator(),
      ),
    );
  }

  static Widget error({size = 200}) {
    return Container(
      height: size,
      width: size,
      decoration:const BoxDecoration(
        color: Color(0xffefefef),
      ),
      child:  Center(
        heightFactor: size,
        widthFactor: size,
        child: Image.asset(
          'assets/image/error_image.png',
          fit: BoxFit.cover,
        ),
        // child: new Icon(Icons.error),
      ),
    );
  }
}