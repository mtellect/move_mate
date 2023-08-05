import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:move_mate/src/utils/colors.dart';
import 'package:move_mate/src/utils/gap.dart';

class ShipButtomNav extends StatelessWidget {
  const ShipButtomNav({super.key, required this.currentPage, required this.onTap});

  final int currentPage;
  final Function(int page) onTap;

  @override
  Widget build(BuildContext context) {
    Map items = {
      "Home": Icons.home_outlined,
      "Calculate": Icons.calculate_outlined,
      "Shipment": Icons.history_outlined,
      "Profile": Icons.person_outline
    };

    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          height: 90,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          alignment: Alignment.topCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: SafeArea(
              top: false,
              bottom: false,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(items.length, (p) {
                  final key = items.keys.toList()[p];
                  final icon = items[key];
                  bool active = p == currentPage;

                  return Expanded(
                      child: GestureDetector(
                    onTap: () {
                      onTap(p);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2),
                      color: Colors.transparent,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(builder: (context) {
                                if ((icon is String) && icon.endsWith("svg")) {
                                  return SvgPicture.asset(icon,
                                      height: 25,
                                      width: 25,
                                      color: primaryColor.withOpacity(active ? 1 : 0.5));
                                }

                                return Icon(icon,
                                    size: 25, color: primaryColor.withOpacity(active ? 1 : 0.5));
                              }),
                              addSpace(5),
                              Text(
                                key,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: active ? FontWeight.w600 : FontWeight.normal,
                                    color: primaryColor.withOpacity(active ? 1 : 0.5)
                                    // color: active ? primaryColor : Colors.black.withOpacity(.5),
                                    ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 4,
                              color: primaryColor.withOpacity(active ? 1 : 0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
