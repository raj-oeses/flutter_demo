import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/test/home_controller.dart';
import 'package:flutter_tests/ui/test/ui_components/ui_components.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
} //       backgroundColor: Color(0xffF9BE21),

class _HomeState extends State<Home> {
  List category = ["Men", "Women", "Kids", "Sports", "Gym"];
  List collection = [
    "Shoes",
    "Lotion",
    "Kids",
    "Sports",
  ];
  List categoryImg = [
    "assets/images/men.png",
    "assets/images/women.png",
    "assets/images/kids.png",
    "assets/images/sports.png",
    "assets/images/gym.png"
  ];
  List recommendedImg = [
    "assets/images/r.png",
    "assets/images/r1.png",
    "assets/images/r.png",
    "assets/images/r1.png",
  ];
  List popularImg = [
    "assets/images/popular1.png",
    "assets/images/popular2.png",
    "assets/images/popular1.png",
    "assets/images/popular2.png",
  ];
  List trendingImg = [
    "assets/images/trending1.png",
    "assets/images/trending2.png",
    "assets/images/trending1.png",
    "assets/images/trending2.png",
  ];
  List collectionImg = [
    "assets/images/shoes.png",
    "assets/images/lotion.png",
    "assets/images/shoes.png",
    "assets/images/lotion.png",
  ];

  List popular = [
    "Nike Sports Shoes",
    "Nike Sports Shoes",
    "Nike Sports Shoes",
    "Nike Sports Shoes",
  ];

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        // leadingWidth: MediaQuery.of(context).size.width * 0.18,
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(
            Icons.sort,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: Image.network(
          'https://cdn2.vectorstock.com/i/1000x1000/04/81/whatsapp-logo-icon-vector-27990481.jpg',
          // "assets/images/hamrodokan.png",
          height: 100,
          width: 150,
        ),
        centerTitle: true,

        actions: [
          InkWell(
            onTap: () {
              homeController.fetchData();
              debugPrint('there you go');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueGrey,
                backgroundImage: AssetImage(
                  "assets/images/profile.png",
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() => homeController.isHomeLoading.value
          ? SizedBox(
              height: Get.height,
              width: Get.width,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search nearby places",
                          hintStyle: const TextStyle(
                              color: Colors.black26, fontSize: 18),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.4),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.4),
                              )),
                          prefixIcon: Container(
                            height: 40,
                            width: 18,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
//==============categories===================
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 30, left: 10),
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController
                                    .homeData.value.category?.length ??
                                0,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      homeController.homeData.value
                                              .category?[index]?.pics ??
                                          '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    homeController.homeData.value
                                            .category?[index]?.name ??
                                        '',
                                    style: TextStyle(
                                      color: index == 0
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 30,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //=================banner=====================
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    "https://d1xv5jidmf7h0f.cloudfront.net/circleone/images/products_gallery_images/polyester-fabric-banner-3_12102612201909.jpg",
                    fit: BoxFit.cover,
                  ),
                ),

                //==============popular now==================================
                const SizedBox(
                  height: 20,
                ),
                ComponentSection(title: 'Popular Now'),
                const SizedBox(
                  height: 10,
                ),

                //====================collections======================================
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Collections",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 10),
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController
                                    .homeData.value.category?.length ??
                                0,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: [
                                  Container(
                                    width: 220,
                                    height: 180,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.09),
                                          spreadRadius: 0,
                                          blurRadius: 15,
                                          offset: const Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        homeController.homeData.value
                                                .category?[index]?.pics ??
                                            '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(homeController.homeData.value
                                            .category?[index]?.name ??
                                        ''),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
//========text banner1=================
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Shop at hamrodokan",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "lorem ipsum lorem ipsum",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //===========trendy products======================
                ComponentSection(title: 'Trending Products'),

                const SizedBox(
                  height: 10,
                ),
                //==========banner2=======================
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    "https://cdn.bannerbuzz.com/media/catalog/product/p/r/processed-fabric-banner.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //===========recommended products======================
                ComponentSection(title: 'Recomended Products'),

                const SizedBox(
                  height: 10,
                ),

                //===========top selling======================
                ComponentSection(title: 'Top Selling'),

                const SizedBox(
                  height: 10,
                ),
                //========text banner2=================
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Fast and secure delivery",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Food delivered on time for fresh taste",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //===========For you======================
                ComponentSection(title: 'For You'),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  final Widget deliverUI;

  ContestTabHeader(
    this.deliverUI,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return deliverUI;
  }

  @override
  double get maxExtent => 150.0;

  @override
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
