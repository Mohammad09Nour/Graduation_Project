import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/controller/account_controller.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/views/details_page.dart';
import 'package:flutter_application_1/widgets/categories_dropdown.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                color: kPrimaryColor,
              ),
              Positioned(
                top: 24,
                left: 14,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white
                    //   border: Border.all(style: BorderStyle.solid),
                    ,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          offset: const Offset(0.0, 1.0), //(x,y)
                          blurRadius: 3.0,
                          spreadRadius: 10)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.11,
                left: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: MemoryImage(widget.user.image)),
                          borderRadius: BorderRadius.circular(75),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                offset: const Offset(0.0, 1.0), //(x,y)
                                blurRadius: 3.0,
                                spreadRadius: 8)
                          ]),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.user.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Text(
                      widget.user.email,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.user.location,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 20),
          child: const Text(
            "Contributions",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        (widget.user.items.length != 0)
            ? Expanded(
                child: GridView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            childAspectRatio: 5 / 6,
                            crossAxisCount: 1),
                    itemCount: widget.user.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildCard(
                          widget.user.items[index], index % 2 == 1);
                    }),
              )
            : Center(
                child: Text("There is no contribution yet"),
              )
      ],
    ));
  }

  Widget buildCard(ItemInfo item, bool isSold) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              item: item,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(item.imageUrl![0]),
                ),
              ),
            ),
          ),
          isSold
              ? Container(
                  decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(30),
                ))
              : Container(),
          isSold
              ? const Center(
                  child: Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
