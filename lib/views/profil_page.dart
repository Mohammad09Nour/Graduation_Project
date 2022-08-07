import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/views/details_page.dart';

class ProfilePage extends StatefulWidget {
  final String url;
  const ProfilePage({Key? key, required this.url}) : super(key: key);

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
                              fit: BoxFit.cover, image: AssetImage(widget.url)),
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
                    const Text("Sliman",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Text(
                      "Syria, Aleppo",
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
            "Contribution",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: /*Container(
            margin: EdgeInsets.only(left: 6, right: 6, top: 6),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            child: 
          ),*/
              GridView.count(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
            crossAxisCount: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            childAspectRatio: 5 / 6,
            children: [
              buildCard('images/p.jpg', false),
              buildCard('images/ppp.jpg', true),
              buildCard('images/pp.jpg', false),
              buildCard('images/pp.jpg', false)
            ],
          ),
        )
      ],
    )
        /*Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 35),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                
              ],
            ),
          ),
          Hero(
            tag: widget.url,
            child: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 28),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 25),
                ],
                borderRadius: BorderRadius.circular(45),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.url),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Sliman",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Syria, Aleppo",
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 20),
            child: Text(
              "Contribution",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 6, right: 6, top: 6),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 5 / 6,
                children: [
                  buildCard('images/p.jpg'),
                  buildCard('images/ppp.jpg'),
                  buildCard('images/pp.jpg'),
                  buildCard('images/pp.jpg')
                ],
              ),
            ),
          )
        ],
      ),*/
        );
  }

  Widget buildCard(String url, bool isSold) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              item: ItemInfo(
                "title",
                [url],
                "phoneNumber",
                "descriptions",
                url,
                DateTime(2020),
              ),
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
                  image: AssetImage(url),
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
