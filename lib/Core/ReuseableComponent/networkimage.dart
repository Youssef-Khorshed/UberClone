import 'package:flutter/material.dart';
import '../strings.dart';

Widget image(
    {required String? url, double? width, double? height, BoxFit? fit}) {
  return FadeInImage(
    width: width,
    height: height,
    image: NetworkImage(url ?? error_image),
    placeholder: const AssetImage("assets/image.png"),
    imageErrorBuilder: (context, error, stackTrace) {
      return Image.asset('assets/error.png', fit: fit);
    },
    fit: BoxFit.fitWidth,
  );
}
