import 'package:carousel_slider/carousel_slider.dart';
import 'package:drgopalsharma/utils/screen_helper.dart';
import 'package:flutter/material.dart';

import '../../widgets/title_widget.dart';

class ServiceSectionWidget extends StatefulWidget {
  const ServiceSectionWidget({super.key});

  @override
  _ServiceSectionWidgetState createState() => _ServiceSectionWidgetState();
}

class _ServiceSectionWidgetState extends State<ServiceSectionWidget> {
  final CarouselController _controller = CarouselController();

  final List _isHovering = [false, false, false, false, false, false, false];
  final List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/urology.jpg',
    'assets/robot.jpg',
    'assets/minimal.jpg',
  ];

  final List<String> places = [
    'Uro-Oncology',
    'Robotic Surgery',
    'Minimally invasive\nSurgery',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          title: "Treatments",
        ),
        const SizedBox(
          height: 24,
        ),
        Stack(
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 18 / 8,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                      for (int i = 0; i < imageSliders.length; i++) {
                        if (i == index) {
                          _isSelected[i] = true;
                        } else {
                          _isSelected[i] = false;
                        }
                      }
                    });
                  }),
              carouselController: _controller,
            ),
            AspectRatio(
              aspectRatio: 18 / 8,
              child: Center(
                child: Text(
                  places[_current],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 8,
                    fontFamily: 'Electrolize',
                    fontSize: screenSize.width / 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ScreenHelper.isMobile(context)
                ? Container()
                : AspectRatio(
                    aspectRatio: 17 / 8,
                    child: Center(
                      heightFactor: 1,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: screenSize.width / 8,
                            right: screenSize.width / 8,
                          ),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 50,
                                bottom: screenSize.height / 50,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i < places.length; i++)
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          onHover: (value) {
                                            setState(() {
                                              value
                                                  ? _isHovering[i] = true
                                                  : _isHovering[i] = false;
                                            });
                                          },
                                          onTap: () {
                                            _controller.animateToPage(i);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: screenSize.height / 80,
                                                bottom: screenSize.height / 90),
                                            child: Text(
                                              places[i],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: _isHovering[i]
                                                    ? Colors.blueGrey[900]
                                                    : Colors.blueGrey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          maintainSize: true,
                                          maintainAnimation: true,
                                          maintainState: true,
                                          visible: _isSelected[i],
                                          child: AnimatedOpacity(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            opacity: _isSelected[i] ? 1 : 0,
                                            child: Container(
                                              height: 5,
                                              decoration: const BoxDecoration(
                                                color: Colors.blueGrey,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              width: screenSize.width / 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
