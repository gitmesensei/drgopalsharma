import 'package:drgopalsharma/pages/contact/contact_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:drgopalsharma/models/skill.dart';
import 'package:drgopalsharma/utils/constants.dart';
import 'package:drgopalsharma/utils/screen_helper.dart';

import '../../widgets/title_widget.dart';

List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 62,
  ),
  Skill(
    skill: "Javascript",
    percentage: 80,
  ),
  Skill(
    skill: "PHP",
    percentage: 78,
  ),
  Skill(
    skill: "Python",
    percentage: 90,
  ),
  Skill(
    skill: "GoLang",
    percentage: 40,
  ),
];

class BookAppointmentWidget extends StatelessWidget {
  const BookAppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          title: "Book Appointment",
        ),
        const SizedBox(
          height: 24,
        ),
        Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ResponsiveWrapper(
                maxWidth: width,
                minWidth: width,
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 2,
                      child: Image.asset(
                        "assets/person_small.png",
                        width:ScreenHelper.isMobile(context)?150: 300.0,
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Fill out form",
                            style: GoogleFonts.oswald(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 28.0,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ContactForm()
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
