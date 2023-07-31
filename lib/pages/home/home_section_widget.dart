import 'package:drgopalsharma/pages/home/components/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/screen_helper.dart';
import 'components/carousel.dart';

class HomeSectionWidget extends StatelessWidget {
  const HomeSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(),
        Carousel(),
        ScreenHelper.isMobile(context)
            ? const SizedBox()
            : const SizedBox(
                height: 20.0,
              ),
        ScreenHelper.isMobile(context)
            ? Center(
                child: Image.asset(
                  "assets/person.png",
                  fit: BoxFit.contain,
                  height: Get.height * 0.55,
                ),
              )
            : const SizedBox(),
        ScreenHelper.isMobile(context)
            ? const SizedBox(
                height: 25.0,
              )
            : const SizedBox(),
      ],
    );
  }
}
