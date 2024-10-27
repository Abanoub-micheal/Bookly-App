import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class CustomImageBestSeller extends StatelessWidget {
  const CustomImageBestSeller({super.key, required this.imageUrl});
  
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height:105,
        child: AspectRatio(
          aspectRatio: 2.7/4,
          child: CachedNetworkImage(
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return Icon(Icons.broken_image_rounded);
              },
              imageUrl: imageUrl)),
        ),
    );
  }
}
