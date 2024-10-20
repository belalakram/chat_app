import 'package:flutter/material.dart';

import '../../../../../core/constatnts/asset_images.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return   Container(
      alignment: Alignment.topCenter,
      child:
      Image.asset(AssetImages.logo, height: size.height * 0.2,),
    );

  }
}
