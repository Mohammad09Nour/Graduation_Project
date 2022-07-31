import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/widgets/networking_page_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final ItemInfo item;
  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ItemInfo item;

  @override
  Widget build(BuildContext context) {
    item = widget.item;
    return Scaffold(
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double opacity = 0.10;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                floating: true,
                delegate: NetworkingPageHeader(0, screenH * 0.4, item)),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 10),
                  locationRow(opacity),
                  const SizedBox(height: 10),
                  mobileRow(opacity),
                  description(opacity),
                  descriptionText(opacity),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Container locationRow(double opacity) {
    return Container(
      color: Colors.grey.withOpacity(0),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse('geo://09568164'));
                },
                icon: Icon(
                  Icons.location_on_rounded,
                  color: kPrimaryColor,
                ),
                label: Text(
                  "Hama, Abi Al-fiedaa",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            SizedBox(width: 2),
            Text(
              "(19 min) 5,9 km",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Container descriptionText(double opacity) {
    return Container(
      color: Colors.grey.withOpacity(opacity),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 10, top: 15, bottom: 15),
        child: Text(
          item.descriptions,
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 21,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Container description(double opacity) {
    return Container(
      color: Colors.grey.withOpacity(0),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 15,
          bottom: 5,
        ),
        child: Text(
          "Description",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Container mobileRow(opacity) {
    return Container(
      color: Colors.grey.withOpacity(0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
          child: TextButton.icon(
            onPressed: () {
              launchUrl(Uri.parse('tel://${item.phoneNumber}'));
            },
            icon: const Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
            label: Text(
              item.phoneNumber,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
