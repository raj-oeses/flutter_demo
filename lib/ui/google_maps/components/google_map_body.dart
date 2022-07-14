import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/google_maps/components/map_page.dart';
import 'package:get/get.dart';

class GoogleMapBody extends StatelessWidget {
  const GoogleMapBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text('Press Me'),
        onPressed: () => Get.to(MapSample()),
      ),
    );
  }
}
