import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/controller/profile_controller.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/views/details_page.dart';
import 'package:flutter_application_1/views/edit_personal_info.dart';
import 'package:flutter_application_1/views/login_screen.dart';
import 'package:get/get.dart';

class EditMyProfile extends StatelessWidget {
  final cur = Get.put(ProfileController());

  EditMyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double pad = 0.05 * size.height;

    return GetX<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: const Color(0xffF8F8FA),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: kPrimaryColor,
              height: 0.3 * size.height,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: pad),
                child: Column(children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      //  mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 0.18 * size.height,
                          width: 0.27 * size.width,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("images/ppp.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.user.value.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 0),
                            Text(
                              controller.user.value.getEmail,
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditPersonalInfo(
                                                controller: controller,
                                              )));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                          "Do you want to delete this account ?"),
                                      content: const Text(
                                          "This action can't be undo"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue[400]),
                                          ),
                                          child: const Text(
                                            "Cancel",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen()));
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red),
                                          ),
                                          child: const Text(
                                            "Delete",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ])
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.26 * size.height),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30, top: 20),
                        child: Text(
                          "My Donations",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        /// color: Colors.blue,
                        height: size.height * 0.65,
                        child: ListView.builder(
                            itemCount: controller.user.value.items.length,
                            itemBuilder: (context, int index) {
                              return _myCard(
                                  controller.user.value.items[index], context);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _myCard(ItemInfo item, BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(item: item)));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 0.4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item.imageUrl[0],
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
              ),
            ),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 0.4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item.imageUrl[0],
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.28,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 17,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Done",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ],
    );
  }
}
