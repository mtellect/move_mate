import 'dart:developer';

import 'package:flutter/material.dart'; 
import 'package:go_router/go_router.dart';
import 'package:move_mate/src/models/shipment_model.dart';
import 'package:move_mate/src/routes/app_routes.dart';
import 'package:move_mate/src/utils/colors.dart';
import 'package:move_mate/src/utils/custom_assets.dart';
import 'package:move_mate/src/utils/gap.dart';
import 'package:move_mate/src/views/common/animated_scroll_view_item.dart';
import 'package:recase/recase.dart';

class ShipShipment extends StatefulWidget {
  const ShipShipment({super.key});

  @override
  State<ShipShipment> createState() => _ShipShipmentState();
}

class _ShipShipmentState extends State<ShipShipment> with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: ShipmentStatus.values.length, vsync: this);
  final ScrollController scrollController = ScrollController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      currentPage = controller.index;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              context.go(AppRoutes.shipHome.path);
            },
          ),
          title: Text("Shipment history"),
          centerTitle: true,
          backgroundColor: primaryColor400,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(30.0),
              child: TabBar(
                  controller: controller,
                  isScrollable: true,
                  indicatorColor: Colors.orange,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3,
                  automaticIndicatorColorAdjustment: true,
                  labelPadding: EdgeInsets.all(10),
                  tabs: List.generate(ShipmentStatus.values.length, (p) {
                    final item = ShipmentStatus.values[p];
                    bool showIndicator = item == ShipmentStatus.all ||
                        item == ShipmentStatus.pendingOrder ||
                        item == ShipmentStatus.inProgress;

                    final items = item == ShipmentStatus.all
                        ? shipmentList
                        : shipmentList.where((e) => e.shipmentStatus == item).toList();

                    bool isActive = currentPage == p;
                    return Container(
                      margin: EdgeInsets.only(left: p == 0 ? 10 : 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            ReCase(item.name).titleCase,
                            style: TextStyle(fontSize: 16),
                          ),
                          if (showIndicator)
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
                              decoration: BoxDecoration(
                                  color: isActive ? Colors.orange : Colors.white12,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "${items.length}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                        ],
                      ),
                    );
                  })))),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Shipments",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                  child: TabBarView(
                      controller: controller,
                      children:
                          List.generate(ShipmentStatus.values.length, (index) => buildPage())))
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.white.withOpacity(.5), boxShadow: [
                BoxShadow(color: Colors.white.withOpacity(.5), blurRadius: 10, spreadRadius: 10)
              ]),
            ),
          )
        ],
      ),
    );
  }

  ShipmentStatus getType(int p) {
    return ShipmentStatus.values[p];
  }

  List<ShipmentModel> get currentList {
    final type = getType(currentPage);
    log("type $type");
    final items = type == ShipmentStatus.all
        ? shipmentList
        : shipmentList.where((e) => e.shipmentStatus == type).toList();
    return items;
  }

  Widget buildPage() {
    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.only(bottom: 150),
      child: Column(
        children: List.generate(currentList.length, (p) {
          final item = currentList[p];
          final status = item.shipmentStatus;
          final shipmentStatus = ReCase(status.name).headerCase;
          final statusIcon = switch (status) {
            ShipmentStatus.inProgress => Icons.sync_outlined,
            ShipmentStatus.pendingOrder => Icons.history,
            ShipmentStatus.loading => Icons.av_timer,
            _ => Icons.cancel_outlined
          };
          final statusColor = switch (status) {
            ShipmentStatus.inProgress => Colors.green,
            ShipmentStatus.pendingOrder => Colors.orange,
            ShipmentStatus.loading => blueColor300,
            _ => Colors.red
          };

          return AnimatedScrollViewItem(
              isFading: true,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black.withOpacity(.04),
                    )),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.02),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.black.withOpacity(.04),
                                )),
                            padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  statusIcon,
                                  color: statusColor,
                                ),
                                addSpaceWidth(5),
                                Text(
                                  shipmentStatus,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: statusColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          addSpace(10),
                          Text(
                            item.title,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          addSpace(10),
                          Text(
                            item.message,
                            style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.7)),
                          ),
                          addSpace(10),
                          Row(
                            children: [
                              Text(
                                "\$${item.amount} USD",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: primaryColor400,
                                    fontWeight: FontWeight.w600),
                              ),
                              addSpaceWidth(5),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.black.withOpacity(.09)),
                              ),
                              addSpaceWidth(5),
                              Text(
                                item.date,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    addSpaceWidth(10),
                    Image.asset(
                      CustomAssets.package,
                      height: 90,
                      width: 90,
                    )
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
