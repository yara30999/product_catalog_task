// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ProductImage extends StatelessWidget {
//   final String imageUrl;
//   const ProductImage({super.key, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(imageUrl, fit: BoxFit.contain, height: 100.h);
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const ProductImage({
    super.key,
    required this.imageUrl,
    this.height = 100,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.contain,
      height: height.h,
      width: width.w,
      placeholder: (context, url) => Center(
        child: SizedBox(
          width: 24.w,
          height: 24.w,
          child: const CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      errorWidget: (context, url, error) =>
          Icon(Icons.broken_image, size: 50.sp, color: Colors.grey),
    );
  }
}
