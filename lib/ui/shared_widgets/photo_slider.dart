import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoSlider extends StatelessWidget {

  final imageUrl;

  PhotoSlider({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      /*placeholder: (ctx, _) => Image.asset(ImageAssets.YELLOW_CHEF),
                errorWidget: (ctx, _, __) => Image.asset(ImageAssets.YELLOW_CHEF),*/
    );
  }
}
