import 'package:flutter/material.dart';

import '../widgets/overylay_container.dart';



class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0,-10,0);

  List<bool> _hovering = [
    false,
    false,
    false,
    false,
    false,
  ];
  int treatmentListIndex=0;


  List<String> menuItems = [
    "About",
    "Treatments",
    "Testimonials",
    "Blogs",
    "Book appointment"
  ];

  final List<String> _listName=[
    'Fillings',
    'RootCanal',
    'Braces & Aligners',
    'Bridges & Crowns',
    'Dentures',
    'Implants',
    'Wisdom Removal',
    'Kids Dentistry',
    'Whitening',
    'Smile Makeover',
    'Ulcers'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: [
          Row(
            children:  List.generate(
                menuItems.length,
                    (index) => buildMenuItem(index)),
          ),
          // OverlayContainer(
          //   show: _hovering[0],
          //   overlay: null,
          //   position: OverlayContainerPosition(MediaQuery.of(context).size.width*0.5, 100),
          //   child: Material(
          //     elevation: 5,
          //     child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: List.generate(
          //             _listName.length,
          //                 (index) => getTreatments(index))
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Widget getTreatments(index)=>Material(
  //   color: Colors.white,
  //   elevation: 0,
  //   shadowColor: Colors.white,
  //   child: InkWell(
  //     onTap: () {
  //       setState(() {
  //         treatmentListIndex = index;
  //       });
  //     },
  //     child: Container(
  //       height: 50,
  //       width:200 ,
  //       child: Padding(
  //         padding: const EdgeInsets.all(12.0),
  //         child: Text(_listName[index]),
  //       ),
  //     ),
  //   ),
  // );

  Widget buildMenuItem(index) => InkWell(
    onTap: () {
      setState(() {
        selectedIndex = index;
      });
    },
    onHover: (value) {
      setState(() {
        value ? hoverIndex = index : hoverIndex = selectedIndex;
      });
      print(value);
    },
    child: MouseRegion(
      onEnter: (value){
        setState(() {
          _hovering[index] = true;
        });
      },
      onExit: (value){
        setState(() {
          _hovering[index] = false;
        });
      },
      child: AnimatedContainer(
        transform: _hovering[index]?hoverTransform:nonHoverTransform,
        constraints: BoxConstraints(minWidth: 122),
        height: 100,
        duration: Duration(milliseconds: 200),
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(menuItems[index],
              style: TextStyle(fontSize: 14, color:_hovering[index]?Colors.cyan:Colors.black87,fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ),
  );

}
