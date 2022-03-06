import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/utilities/sizeconfig.dart';
import 'package:flutter_tests/widgets/image_loader_error.dart';

class CustomImage extends StatelessWidget {
  final double? cornerRadius;
  final String? imageUrl;
  final double? imageWidth;
  final double? imageHeight;

  const CustomImage(
      {required this.imageUrl,
      this.cornerRadius = 10,
      this.imageWidth,
      this.imageHeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(cornerRadius!),
        topLeft: Radius.circular(cornerRadius!),
        bottomRight: Radius.circular(cornerRadius!),
        bottomLeft: Radius.circular(cornerRadius!),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: BoxFit.cover,
        width: imageWidth ?? SizeConfig.width() * .5,
        height: imageHeight ?? SizeConfig.height() * .5,
        placeholder: (context, url) =>
            ImageLoaderError.loading(size: SizeConfig.width() * .15),
        errorWidget: (context, url, error) => ImageLoaderError.error(
          size: SizeConfig.width() * .15,
        ),
      ),
    );
  }
}
