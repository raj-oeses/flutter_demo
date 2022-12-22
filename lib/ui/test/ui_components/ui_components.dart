import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class ComponentSection extends StatelessWidget {
  final String? title;

  const ComponentSection({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Container(
      // height: 300,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  title??"",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  // onTap: () =>  Get.toNamed(Routes.PRODUCTLIST),
                  child: Row(
                    children: const [
                      Text(
                        "View All  ",
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff4F4F4F),
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 330,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 30),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: homeController.homeData.value.banner?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    // onTap: () => Get.toNamed(Routes.DESCRIPTION),
                    child: Container(
                      width: 215,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.09),
                            spreadRadius: 0,
                            blurRadius: 15,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: 215,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Image.network(
                                homeController.homeData.value.banner?[index]
                                        ?.imageUrl ??
                                    '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                            child: Text(
                              homeController
                                      .homeData.value.banner?[index]?.name ??
                                  '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: const TextSpan(children: [
                                  TextSpan(
                                    text: "Rs.",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  TextSpan(
                                    text: "245",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ])),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.red,
                                    size: 35,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
