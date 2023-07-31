import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:drgopalsharma/models/testimonial.dart';
import 'package:drgopalsharma/utils/constants.dart';
import 'package:drgopalsharma/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Testimonial> testimonials = [
  Testimonial(
    text: "Don’t Ignore These Warning Signs of Prostate Problems",
    occupation: "https://www.medanta.org/patient-education-blog/dont-ignore-these-5-warning-signs-of-uro-oncology-conditions/",
    personName: "",
    profilePhoto: "assets/blog1.jpg",
  ),
  Testimonial(
    text:
        "Understanding Kidney Cancer: Causes, Symptoms, and Treatment Options",
    occupation: "https://www.medanta.org/patient-education-blog/understanding-kidney-cancer-causes-symptoms-and-treatment-options/",
    personName: "",
    profilePhoto: "assets/blog2.jpg",
  )
];

class TestimonialWidget extends StatelessWidget {
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
}

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Blogs",
                style: GoogleFonts.oswald(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  height: 1.3,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              // Container(
              //   constraints: BoxConstraints(maxWidth: 400.0),
              //   child: RichText(
              //     text: TextSpan(
              //       children: [
              //         TextSpan(
              //           text:
              //               "This is the portfolio section. There is alot of work here",
              //           style: TextStyle(color: Colors.black, height: 1.8),
              //         ),
              //         TextSpan(
              //             text: " click here to contact us",
              //             style: TextStyle(
              //               color: kPrimaryColor,
              //               fontWeight: FontWeight.w700,
              //               height: 1.8,
              //             )),
              //         TextSpan(
              //           text: ". Please subscribe to me youtube channel :-)",
              //           style: TextStyle(color: Colors.black, height: 1.8),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 45.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                // Lets map
                children: testimonials.map((testimonial) {
                  return Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 1,
                    child: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(testimonial.occupation));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(bottom: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Container(
                            //   child: Image.asset(
                            //     "assets/quote.png",
                            //     width: 50.0,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 15.0,
                            // ),
                            Text(
                              testimonial.text,
                              style: TextStyle(
                                  color: Colors.black,
                                  height: 1.8,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Image.asset(testimonial.profilePhoto,width:300 ,height: 300,)
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    ),
  );
}
