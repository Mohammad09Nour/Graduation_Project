import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

class NetworkingPageHeader extends SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final ItemInfo item;

  NetworkingPageHeader(this.minExtent, this.maxExtent, this.item);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return FullScreenWidget(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Hero(
              tag: 'cusatomTag',
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.white,
                child: Image.asset(
                  item.imageUrl[0],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  stops: [0.5, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.repeated),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white.withOpacity(titleOpacity(shrinkOffset)),
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // color: kBackgroundColor.withOpacity(titleOpacity(shrinkOffset)),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: kPrimaryColor.withOpacity(titleOpacity(shrinkOffset)),
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  double titleOpacity(double shrinkOffset) {
    return 1 - max(0, shrinkOffset) / maxExtent;
  }
}
