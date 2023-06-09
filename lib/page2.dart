import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashionhub/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  CarouselController buttonCarouselController = CarouselControllerImpl();

  List subImages = [
    'assets/images/subproduct1.png',
    'assets/images/product1.png',
    'assets/images/subproduct2.png',
  ];

  int index = 1;
  bool _isSelected0 = false;
  bool _isSelected1 = true;
  bool _isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 1,
              height: MediaQuery.of(context).size.height,
            ),
            items: subImages.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Hero(
                            tag: i,
                            child: Image(
                              fit: BoxFit.contain,
                              image: AssetImage(i),
                            ),
                          ),
                        ],
                      ));
                },
              );
            }).toList(),
          ),
          Positioned(
              left: 20,
              top: 280,
              child: IconButton(
                  icon: const Icon(Icons.chevron_left,
                      color: Color.fromRGBO(63, 59, 53, 1)),
                  onPressed: () {
                    buttonCarouselController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                    setState(() {
                      index--;
                      if (index < 0) {
                        index = 2;
                      }
                      if (index == 0) {
                        _isSelected0 = true;
                        _isSelected1 = false;
                        _isSelected2 = false;
                      } else if (index == 1) {
                        _isSelected0 = false;
                        _isSelected1 = true;
                        _isSelected2 = false;
                      } else if (index == 2) {
                        _isSelected0 = false;
                        _isSelected1 = false;
                        _isSelected2 = true;
                      }
                    });
                  })),
          Positioned(
              right: 20,
              top: 280,
              child: IconButton(
                  icon: const Icon(Icons.chevron_right,
                      color: Color.fromRGBO(63, 59, 53, 1)),
                  onPressed: () {
                    buttonCarouselController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                    setState(() {
                      index++;
                      if (index > 2) {
                        index = 0;
                      }
                      if (index == 0) {
                        _isSelected0 = true;
                        _isSelected1 = false;
                        _isSelected2 = false;
                      } else if (index == 1) {
                        _isSelected0 = false;
                        _isSelected1 = true;
                        _isSelected2 = false;
                      } else if (index == 2) {
                        _isSelected0 = false;
                        _isSelected1 = false;
                        _isSelected2 = true;
                      }
                    });
                  })),
          Positioned(
            // top: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 55,
              child: AppBar(
                backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                elevation: 0,
                leading: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.chevron_left, color: Colors.black,)),
                actions: [
                  Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(
                        width: 15,
                      ),
                      Badge(
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          alignment: AlignmentDirectional.topEnd,
                          label: const Text('3'),
                          child: Icon(
                            MyFlutterApp.shoppingBagOutline,
                            color: const Color.fromRGBO(53, 51, 62, 1),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 210,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(221, 251, 251, 251),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("PITTI Block - Jacket",
                              style: GoogleFonts.sanchez(
                                  fontSize: 19.5, fontWeight: FontWeight.bold)),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 5.0, right: 23),
                            child: Text("\$112.99",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)))
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 70,
                              height: 50,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 5.0, left: 6.5),
                                    child: Text(
                                      'Size',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 1.0, left: 6.5),
                                    child: Text(
                                      'Large',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(53, 51, 62, 1),
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: 70,
                              height: 50,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 5.0, left: 6.5),
                                    child: Text(
                                      'Color',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 8,
                                    width: 55,
                                    margin:
                                        const EdgeInsets.only(left: 6, top: 7),
                                    decoration: const BoxDecoration(
                                        color: Color.fromRGBO(53, 51, 62, 1),
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(10),
                                            right: Radius.circular(10))),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 150,
                              height: 50,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.remove,
                                    color: Color.fromRGBO(53, 51, 62, 1),
                                  ),
                                  Text(
                                    "01",
                                    style: TextStyle(
                                        color: Color.fromRGBO(53, 51, 62, 1),
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Color.fromRGBO(53, 51, 62, 1),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: 150,
                              height: 50,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 5.0, left: 10.5),
                                    child: Text(
                                      'Composition',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 1.0, left: 10.5),
                                    child: Text(
                                      'Silk Bamboo',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(53, 51, 62, 1),
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 70,
                          height: 115,
                          margin: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: themeColor,
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                MyFlutterApp.add,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'Add',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
          Positioned(
            bottom: 220,
            left: 100,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(221, 255, 255, 255),
              ),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                              color: _isSelected0
                                  ? themeColor
                                  : Colors.transparent,
                              width: 2)),
                      child: Image(image: AssetImage(subImages[0])),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                              color: _isSelected1
                                  ? themeColor
                                  : Colors.transparent,
                              width: 2)),
                      child: Image(image: AssetImage(subImages[1])),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                              color: _isSelected2
                                  ? themeColor
                                  : Colors.transparent,
                              width: 2)),
                      child: Image(image: AssetImage(subImages[2])),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
