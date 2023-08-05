import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:move_mate/src/controller/index_controller.dart';
import 'package:move_mate/src/models/search_model.dart';
import 'package:move_mate/src/utils/colors.dart';
import 'package:move_mate/src/utils/custom_assets.dart';
import 'package:move_mate/src/utils/gap.dart';
import 'package:provider/provider.dart';

class SearchReceipt extends StatefulWidget {
  const SearchReceipt({super.key});

  @override
  State<SearchReceipt> createState() => _SearchReceiptState();
}

class _SearchReceiptState extends State<SearchReceipt> {
  final searchController = TextEditingController();
  late List<SearchModel> items = searchItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [buildSearchItem(), buildSearchResults()],
      ),
    );
  }

  Widget buildSearchItem() {
    return Container(
      color: primaryColor400,
      padding: EdgeInsets.fromLTRB(0, 30, 15, 15),
      child: Column(
        children: [
          Row(
            children: [
              BackButton(
                color: Colors.white,
                onPressed: () {
                  context.read<IndexController>().setTabVisiblity(true);
                  context.pop();
                },
              ),
              Expanded(
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
                          child: TextField(
                        controller: searchController,
                        cursorColor: Colors.black.withOpacity(.2),
                        onChanged: (value) async {
                          await Future.delayed(Duration(milliseconds: 100));
                          final text = searchController.text;
                          if (text.isEmpty) {
                            items = searchItems;
                          } else {
                            items = searchItems
                                .where((e) =>
                                    e.title.toLowerCase().startsWith(text.toLowerCase()) ||
                                    e.id.toLowerCase().startsWith(text.toLowerCase()))
                                .toList();
                          }
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search by item name, receipt number...",
                            hintStyle: TextStyle(color: Colors.black.withOpacity(.3))),
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
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSearchResults() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.02), blurRadius: 5, spreadRadius: 2)
          ],
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      child: Column(
        children: List.generate(items.length, (p) {
          final res = items[p];
          final title = res.title;
          final id = res.id;
          final from = res.from;
          final to = res.to;

          return Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.black.withOpacity(p == items.length - 1 ? 0 : .05)))),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(color: primaryColor400, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Image.asset(
                    CustomAssets.deliveryBox,
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                ),
                addSpaceWidth(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      addSpace(4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            id,
                            style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(.5)),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.5), shape: BoxShape.circle),
                          ),
                          Text(
                            from,
                            style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(.5)),
                          ),
                          addSpaceWidth(5),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: Colors.black.withOpacity(.3),
                          ),
                          addSpaceWidth(5),
                          Text(
                            to,
                            style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(.5)),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
