import 'package:flutter/material.dart';


import '../../models/Service.dart';
import '../../utils/constants.dart';
import '../../widgets/section_title.dart';
import 'components/service_card.dart';

class ServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          // const SectionTitle(
          //   color: Color(0xFFFF0000),
          //   title: "Service Offerings",
          //   subTitle: "My Strong Arenas",
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                services.length, (index) => ServiceCard(index: index)),
          )
        ],
      ),
    );
  }
}
