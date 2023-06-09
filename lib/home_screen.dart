import 'package:fashionhub/models.dart';
import 'package:fashionhub/my_flutter_app_icons.dart';
import 'package:fashionhub/page2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 5, end: 10).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'ISSACS',
          style: GoogleFonts.sanchez(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          MyFlutterApp.sort,
          color: Colors.black,
        ),
        actions: [
          Row(
            children: [
              Badge(
                backgroundColor: Colors.red,
                textColor: Colors.white,
                alignment: AlignmentDirectional.topStart,
                label: const Text('3'),
                child: Icon(
                  MyFlutterApp.notification,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 60,
                margin: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        MyFlutterApp.search,
                        color: Colors.grey,
                        size: 22,
                      ),
                      label: const Text(
                        "Search products",
                        style: TextStyle(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(254, 254, 254, 1),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              margin: const EdgeInsets.only(top: 10, left: 23),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categories.length,
                itemBuilder: ((context, index) {
                  final Category = Categories[index];
                  return Container(
                    height: 40,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromRGBO(251, 251, 251, 1),
                            radius: 29,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Image.asset(
                                Category.img,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          Category.imgName,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 13, left: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Arrivals',
                    style:
                        GoogleFonts.sanchez(fontSize: 18.5, color: Colors.black),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.75),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                final Animation<double> _animation2 =
                    Tween<double>(begin: 5, end: 5).animate(CurvedAnimation(
                        parent: _animationController, curve: Curves.easeInOut));
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Page2()),
                    );
                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width),
                    color: Colors.white,
                    margin: (index % 2 == 0)
                              ? const EdgeInsets.only(left: 15, right: 7.5, top: 10)
                              : const EdgeInsets.only(left: 7.5, right: 15),
                    child: Stack(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width),
                          height: (index % 2 == 0) ? 180 : 165,
                          // margin: (index % 2 == 0)
                          //     ? const EdgeInsets.only(left: 15, right: 7.5, top: 10)
                          //     : const EdgeInsets.only(left: 7.5, right: 15),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(242, 242, 242, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Hero(
                            tag: product.img,
                            child: Image(
                              image: AssetImage(product.img),
                            ),
                          ),
                        ),
                         Positioned(
                            right: 13,
                            top: 8,
                            child: GestureDetector(
                              onTap: () {
                                    setState(() {
                                      product.liked = !product.liked;
                                    });
                                    _animationController.forward().then(
                                        (value) => _animationController.reverse());
                                  },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: ScaleTransition(
                                  scale: product.liked ? _animation : _animation2,
                                  child: Icon(
                                    product.liked
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color:
                                        product.liked ? Colors.red : Colors.grey,
                                    size: 5,
                                  ),
                                ),
                              ),
                            )),
                            Positioned(
                          top: (index % 2 ==0 ) ? 130 : 165,
                            child: Container(
                          margin: (index % 2 == 0)
                              ? const EdgeInsets.only(left: 15, right: 7.5, top: 50)
                              : const EdgeInsets.only(left: 7.5, right: 15),
                          height: 90,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0, bottom: 3),
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$${product.price}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(width: 20,),
                                  Text(
                                    '\$${product.cancelledPrice}',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.5,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
