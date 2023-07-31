import 'package:drgopalsharma/pages/service/components/service_card.dart';
import 'package:drgopalsharma/pages/service/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:drgopalsharma/models/design_process.dart';
import 'package:drgopalsharma/utils/constants.dart';
import 'package:drgopalsharma/utils/screen_helper.dart';


class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor, width: 2)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Fellowship-trained robotic\nsurgeon",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor, width: 2)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Intuitive certified Console\nsurgeon",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor, width: 2)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "An active researcher and Editorial\nboard member of IJU and WJUR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            "Dr. Gopal Sharma works as a Consultant-Uro Oncology and Robotic Surgery at Medanta The Medicity Gurugram. He has a special interest in the management of urological cancers such as prostate, kidney and bladder. Previously, he worked as an Associate Consultant in the Department of Urologic Oncology and Robotic Surgery at Max Super Speciality Hospitals, Saket, Delhi. After completing his basic training in Surgery and Urology, he received one-year training in robotic surgery through a competitively selected prestigious and internationally accredited “Vattikuti Fellowship in Robotic Surgery”. Subsequently, he has been certified by Intuitive Surgical Systems as a “Console” surgeon. He is dedicated to the field of Uro Oncology and has experience of managing patients with various urological cancers.\n\nApart from clinical work, he has published extensively on urological and surgical research with over 80 peer-reviewed articles, national and international research presentations and authored textbook chapters. He has been a lead/co-investigator in various National and International research projects. He is credited with the development of two clinically useful nomograms in urological cancers. He is an active reviewer for various National and International Journals and serves as an Editorial Board Member for the Indian Journal of Urology and the World Journal of Urology.",
            style: GoogleFonts.aBeeZee(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 1,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "QUALIFICATIONS & EXPERIENCES",
                style: GoogleFonts.aBeeZee(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          LayoutBuilder(
            builder: (_context, constraints) {
              return ResponsiveGridView.builder(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                alignment: Alignment.topCenter,
                gridDelegate: ResponsiveGridDelegate(
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                          ScreenHelper.isMobile(context)
                      ? constraints.maxWidth / 1.5
                      : 250.0,
                  // Hack to adjust child height
                  childAspectRatio: ScreenHelper.isDesktop(context)
                      ? 0.7
                      : MediaQuery.of(context).size.aspectRatio * 0.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ServiceCard(
                    index: index,
                  );
                },
              );
            },
          ),



        ],
      ),
    );
  }
}
