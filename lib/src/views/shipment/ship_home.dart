import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:move_mate/src/controller/index_controller.dart';
import 'package:move_mate/src/utils/colors.dart';
import 'package:move_mate/src/utils/navigation.dart';
import 'package:provider/provider.dart';
import 'package:move_mate/src/utils/custom_assets.dart';
import 'package:move_mate/src/utils/gap.dart';

import 'search_receipt.dart';

class ShipHome extends StatefulWidget {
  const ShipHome({super.key});

  @override
  State<ShipHome> createState() => _ShipHomeState();
}

class _ShipHomeState extends State<ShipHome> {
  List items = [
    {"title": "Ocean freight", "route": "International", "icon": CustomAssets.ship},
    {"title": "Cargo freight", "route": "Reliable", "icon": CustomAssets.bus},
    {"title": "Air freight", "route": "International", "icon": CustomAssets.airplane}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildAppBar(),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                buildTrackingItem(),
                buildVehiclesItems(),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Container buildAppBar() {
    return Container(
      color: primaryColor400,
      padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  CustomAssets.cat3,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
              addSpaceWidth(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RotatedBox(
                            quarterTurns: 1,
                            child: Transform.rotate(
                                angle: -math.pi / 4,
                                child: Icon(
                                  Icons.navigation,
                                  color: Colors.white.withOpacity(.6),
                                  size: 18,
                                ))),
                        addSpaceWidth(5),
                        Text(
                          "Your location",
                          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(.6)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Oshodi-Oke,Lagos",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        addSpaceWidth(5),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: primaryColor,
                      shape: CircleBorder()),
                  child: Icon(
                    Icons.notifications_outlined,
                  ))
            ],
          ),
          addSpace(20),
          GestureDetector(
            onTap: () {
              context.read<IndexController>().setTabVisiblity(false);
              pushAndResult(context, SearchReceipt(), fade: true, materialRoute: false);
            },
            child: Container(
              height: 55,
              padding: EdgeInsets.only(left: 10),
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Icon(Icons.search),
                  addSpaceWidth(10),
                  Expanded(
                      child: Text(
                    "Enter the receipt number....",
                    style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(.4)),
                  )),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.orange[700],
                          foregroundColor: Colors.white,
                          shape: CircleBorder()),
                      child: Icon(
                        Icons.document_scanner,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTrackingItem() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tracking",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          addSpace(15),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(.02), blurRadius: 5, spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipment Number",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "#NEJ20089934122231",
                              style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(.3)),
                            ),
                          ],
                        ),
                      ),
                      addSpaceWidth(10),
                      Image.asset(
                        CustomAssets.forklift,
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 0, bottom: 0, right: 15, left: 15),
                  color: Colors.black.withOpacity(.05),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(.6), shape: BoxShape.circle),
                          child: Icon(
                            Icons.unarchive,
                            color: Colors.black45,
                          )),
                      addSpaceWidth(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sender",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(.3),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Oshodi Oke, 5243",
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(.3),
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration:
                                    BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                              ),
                              addSpaceWidth(5),
                              Text(
                                "2 to 3 days",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(.6), shape: BoxShape.circle),
                          child: Icon(
                            Icons.archive,
                            color: Colors.black45,
                          )),
                      addSpaceWidth(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Receiver",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(.3),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Ketu, 1002",
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Status",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(.3),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Waiting to collect",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  // margin: EdgeInsets.only(top: 0, bottom: 0, right: 15, left: 15),
                  color: Colors.black.withOpacity(.05),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.orange, backgroundColor: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                        ),
                        addSpaceWidth(5),
                        Text(
                          "Add Shop",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildVehiclesItems() {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available Vehicles",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          addSpace(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(items.length, (p) {
                final item = items[p];
                final title = item["title"];
                final route = item["route"];
                final icon = item["icon"];
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(.04)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      route,
                      style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(.3)),
                    ),
                    addSpace(20),
                    SvgPicture.asset(
                      icon,
                      height: 100,
                      width: 100,
                    )
                  ]),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
