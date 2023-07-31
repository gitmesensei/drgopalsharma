import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants.dart';
import '../../utils/screen_utils.dart';
import '../../widgets/section_title.dart';
import 'components/socal_card.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 2.5),
          const SectionTitle(
            title: "Contact Me",
            subTitle: "For Project inquiry and information",
            color: Color(0xFF07E24A),
          ),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  ContactBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1110),
      margin: const EdgeInsets.only(top: kDefaultPadding * 2),
      padding: const EdgeInsets.all(kDefaultPadding * 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocalCard(
                color: const Color(0xFFD9FFFC),
                iconSrc: "assets/images/skype.png",
                name: 'TheFlutterWay',
                press: () {},
              ),
              SocalCard(
                color: const Color(0xFFE4FFC7),
                iconSrc: "assets/images/whatsapp.png",
                name: 'TheFlutterWay',
                press: () {},
              ),
              SocalCard(
                color: const Color(0xFFE8F0F9),
                iconSrc: "assets/images/messanger.png",
                name: 'TheFlutterWay',
                press: () {},
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding * 2),
          ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  ContactForm({
    Key? key,
  }) : super(key: key);
  final nameTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final enquiryTextEditingController = TextEditingController();
  final locationTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              controller: nameTextEditingController,
              decoration: const InputDecoration(
                labelText: "Your Name*",
                hintStyle: TextStyle(fontSize: 12),
                hintText: "Enter Your Name",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              controller: phoneTextEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Phone number*",
                hintStyle: TextStyle(fontSize: 12),
                hintText: "Enter your phone number",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              controller: enquiryTextEditingController,
              decoration: const InputDecoration(
                labelText: "Enquiry*",
                hintStyle: TextStyle(fontSize: 12),
                hintText: "Write about treatment you are looking for",
              ),
            ),
          ),
          SizedBox(
            // height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              onChanged: (value) {},
              controller: locationTextEditingController,
              decoration: const InputDecoration(
                labelText: "Location*",
                hintStyle: TextStyle(fontSize: 12),
                hintText: "Enter your location",
              ),
            ),
          ),
          Center(
            child: FittedBox(
              child: ElevatedButton(
                onPressed: () {
                  if (nameTextEditingController.text.isNotEmpty &&
                      phoneTextEditingController.text.isNotEmpty &&
                      locationTextEditingController.text.isNotEmpty &&
                      enquiryTextEditingController.text.isNotEmpty) {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }

                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'gopal.26669192@gmail.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Patient Enquiry: ${nameTextEditingController.text}',
                        'body':
                            "name: ${nameTextEditingController.text}\nphone: ${phoneTextEditingController.text}\nenquiry: ${enquiryTextEditingController.text}\nlocation: ${locationTextEditingController.text}"
                      }),
                    );
                    launchUrl(emailLaunchUri);
                  } else {
                    ScreenUtil.showToast(
                        "Fill all fields", Colors.red, context);
                  }
                },
                child: const Center(child: Text("Submit")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
