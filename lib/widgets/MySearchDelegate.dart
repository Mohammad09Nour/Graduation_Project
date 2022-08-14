import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/views/details_page.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return getResult(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  Widget getResult(context) {
    ItemInfo item = ItemInfo(
        'this title for test',
        [],
        '963956816079',
        'someDescription for test',
        'p.jpg',
        DateTime(2020),
        User(items: [], image: Uint8List(0)));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(itemBuilder: (context, int idx) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(item: item)));
            },
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    offset: const Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                    spreadRadius: 4)
              ]),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.8,
                    height: 110,
                    child: const Image(
                      image: AssetImage("images/pp.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Some short title",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(children: const [
                        Text("Donator : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Samer")
                      ]),
                      const SizedBox(height: 8),
                      Row(children: const [
                        Icon(Icons.location_on_sharp),
                        Text("Homs, Al-baath")
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
