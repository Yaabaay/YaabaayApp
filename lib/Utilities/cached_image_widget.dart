import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {

  CachedImage({
    Key? key,
    required this.url,
    this.color,
    this.fit,
  }) : super(key: key);

  final String url;
  Color? color;
  BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 100,
      imageUrl: url,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: color ?? Colors.black12,
        ),
      ),
      errorWidget: (context, url, error) => const Center(child:  Icon(Icons.error),),
    );
  }
}
