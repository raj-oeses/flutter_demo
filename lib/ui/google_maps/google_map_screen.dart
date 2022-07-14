import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/google_maps/components/google_map_body.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMapBody(),
    );
  }
}
