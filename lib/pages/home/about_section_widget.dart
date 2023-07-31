import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';
import '../../widgets/title_widget.dart';
import 'components/cv_section.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          title: "About",
        ),
        SizedBox(height: 24,),
        CvSection(),
        const SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
