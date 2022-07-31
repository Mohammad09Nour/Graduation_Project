import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/views/details_page.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty)
              close(context, null);
            else
              query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
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
    ItemInfo item = new ItemInfo('this title for test', ['images/pp.jpg'],
        '963956816079', 'someDescription for test', 'p.jpg', DateTime(2020));
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
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                    spreadRadius: 4)
              ]),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.8,
                    height: 110,
                    child: Image(
                      image: AssetImage("images/pp.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Some short title",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(children: [
                        Text("Donator : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Samer")
                      ]),
                      SizedBox(height: 8),
                      Row(children: [
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
