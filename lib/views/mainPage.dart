import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/controller/home_page_controller.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/views/details_page.dart';
import 'package:flutter_application_1/views/profil_page.dart';
import 'package:flutter_application_1/widgets/MySearchDelegate.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class MainHomePage extends StatelessWidget {
  MainHomePage({Key? key}) : super(key: key);
  final homePAgeController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    print("55r");
    ItemInfo item = ItemInfo(
        "Title",
        ["images/p.jpg"],
        "+96395681679",
        " world this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this world this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this world this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this world this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world this timehello world this world this timehello world this timehello world this timehello world this time",
        'images/pic.jpg',
        DateTime(2020));
    return Column(
      children: [
        Container(
          height: 50,
          color: kPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  color: Colors.blue,
                  onPressed: () {
                    showSearch(context: context, delegate: MySearchDelegate());
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        GetX<HomePageController>(builder: (controller) {
          return Expanded(
            child: Container(
              padding: EdgeInsets.all(6),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 8),
                itemCount: controller.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildPostCard(context, item);
                },
              ),
            ),
          );
        })
      ],
    );
  }

  Widget buildPostCard(BuildContext context, ItemInfo item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProfilePage(url: item.urlProfileImage)));
                  },
                  child: CircleAvatar(
                    radius: 17,
                    child: ClipOval(
                      child: Center(child: Image.asset(item.urlProfileImage)),
                    ),
                  ),
                ),
                SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sliman",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2/5/2022",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "(19 min) 5,9 km",
                        style: TextStyle(color: kPrimaryColor, fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ReadMoreText(
                    "some description for this post and this description will be available on monday some description for this post and this description will be available on monday",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    colorClickableText: kPrimaryColor,
                    trimCollapsedText: '...Read more',
                    trimExpandedText: ' Less',
                    style: TextStyle(
                        fontSize: 17, textBaseline: TextBaseline.alphabetic),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailsPage(item: item);
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width - 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(item.imageUrl[0])),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
