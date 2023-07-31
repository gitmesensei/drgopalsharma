import 'package:flutter/material.dart';

class Service {
  final int? id;
  final String? title, image, subtitle;
  final Color? color;


  Service({this.id, this.title, this.image, this.color,this.subtitle});
}

final List<Service> services = [
  Service(
    title: "VATTIKUTI FELLOWSHIP\nIN ROBOTIC SURGERY",
    image: "assets/vattikuti.png",
    subtitle: "A full stack allround designer thay may or may not include a guide for specific creative ",
    color: Color(0xFFD9FFFC),
  ),
  Service(
    title: "M.Ch. (Urology), P.G.I.M.E.R,\nChandigarh, 2021",
    image: "assets/pgimer2.png",
    subtitle: "A full stack allround developer thay may or may not include a guide for specific creative",
    color: Color(0xFFFFE0E0),
  ),
  Service(
    title: "M.S. (General Surgery), P.G.I.M.E.R,\nChandigarh, 2017",
    image: "assets/pgimer.png",
    subtitle: "A full stack allround writer thay may or may not include a guide for specific creative",
    color: Color(0xFFFFF3DD),
  ),
  Service(
    title: "M.B.B.S, M.A.M.C,\nNew Delhi, 2014",
    image: "assets/mamc.png",
    subtitle: "A full stack allround promoter thay may or may not include a guide for specific creative",
    color: Color(0xFFE4FFC7),
  ),
];
// For demo list of service
// List<Service> services = [
//   Service(
//     id: 1,
//     title: "Graphic Design",
//     image: "assets/images/graphic.png",
//     color: Color(0xFFD9FFFC),
//   ),
//   Service(
//     id: 2,
//     title: "Web Design",
//     image: "assets/images/desktop.png",
//     color: Color(0xFFE4FFC7),
//   ),
//   Service(
//     id: 3,
//     title: "UI Design",
//     image: "assets/images/ui.png",
//     color: Color(0xFFFFF3DD),
//   ),
//   Service(
//     id: 4,
//     title: "Interaction Design",
//     image: "assets/images/Intreaction_design.png",
//     color: Color(0xFFFFE0E0),
//   ),
// ];
