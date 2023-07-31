
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drgopalsharma/models/carousel_item_model.dart';
import 'package:drgopalsharma/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Urologic Oncology and Robotic Surgery",
            style: GoogleFonts.arvo(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              fontSize: 38.0,
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Text(
            "Dr. Gopal Sharma",
            style: GoogleFonts.oswald(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
              height: 1.3,
              letterSpacing: 1
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "Consultant-Uro Oncology and Robotic Surgery at Medanta The Medicity Gurugram",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            child: const Wrap(
              children: [
                Text(
                  "Feel Free to contact us any time.\n",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 48.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "CONTACT US",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 48.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: TextButton(
                    onPressed: () {
                      String uri = "https://www.medanta.org/doctors/dr-gopal-sharma";
                      launchUrl(Uri.parse(uri));
                    },
                    child: const Text(
                      "Visit Hospital Website",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          GestureDetector(
            onTap: () {},
            child: const MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                "Note: We will get back to you as soon as we can or\nYou can call directly to our team member for appointment schedule.",
                style: TextStyle(
                  height: 1.5,
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    image: Image.asset(
      "assets/person.png",
      fit: BoxFit.contain,
      height: Get.height*0.7,
    ),
  ),
);
