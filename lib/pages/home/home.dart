import 'package:drgopalsharma/pages/home/about_section_widget.dart';
import 'package:drgopalsharma/pages/home/home_section_widget.dart';
import 'package:drgopalsharma/pages/home/service_section_widget.dart';
import 'package:drgopalsharma/pages/service/service_section.dart';
import 'package:drgopalsharma/pages/service/services.dart';
import 'package:drgopalsharma/utils/screen_helper.dart';
import 'package:drgopalsharma/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:drgopalsharma/pages/home/components/carousel.dart';
import 'package:drgopalsharma/pages/home/components/cv_section.dart';
import 'package:drgopalsharma/pages/home/components/education_section.dart';
import 'package:drgopalsharma/pages/home/components/footer.dart';
import 'package:drgopalsharma/pages/home/components/header.dart';
import 'package:drgopalsharma/pages/home/components/ios_app_ad.dart';
import 'package:drgopalsharma/pages/home/components/portfolio_stats.dart';
import 'package:drgopalsharma/pages/home/components/sponsors.dart';
import 'package:drgopalsharma/pages/home/components/testimonial_widget.dart';
import 'package:drgopalsharma/pages/home/components/website_ad.dart';
import 'package:drgopalsharma/utils/constants.dart';
import 'package:drgopalsharma/utils/globals.dart';
import 'package:get/get.dart';

import 'book_appointment_widget.dart';

class Home extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  Home({super.key});

  void _scrollToSection(position) {
    _scrollController.animateTo(
      position, // Replace with the position of the desired section
      duration: const Duration(
          milliseconds: 500), // Optional: adjust the duration as per your needs
      curve: Curves.easeInOut, // Optional: choose the desired easing curve
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: () {
                              headerItems[index].onTap;
                            },
                            child: Text(
                              headerItems[index].title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {},
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeSectionWidget(),
            const AboutSectionWidget(),
            const ServiceSectionWidget(),
            const BookAppointmentWidget(),
            TestimonialWidget(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
