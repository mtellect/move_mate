
import 'package:flutter/material.dart';
import 'package:move_mate/src/routes/app_routes.dart';
import 'package:move_mate/src/utils/colors.dart';
import 'package:move_mate/src/utils/custom_assets.dart';
import 'package:move_mate/src/utils/gap.dart'; 
import 'package:go_router/go_router.dart';

class ShipCalculate extends StatefulWidget {
  const ShipCalculate({super.key});

  @override
  State<ShipCalculate> createState() => _ShipCalculateState();
}

class _ShipCalculateState extends State<ShipCalculate> with SingleTickerProviderStateMixin {
  int selectedCategory = -1;
  List categoriesOptions = [
    "Documents",
    "Glass",
    "Liquid",
    "Food",
    "Electronics",
    "Products",
    "Others"
  ];
  List packagingOptions = [
    {
      "title": "Envelope",
      "category": "Smaller packaging",
      "description": "Size: 35 × 27.5 cm (weight: up to 0.5 kg)"
    },
    {
      "title": "Box 2",
      "category": "Smaller packaging",
      "description": "Size: 33.7 × 18.2 × 10 cm (weight: up to 1 kg))"
    },
    {
      "title": "Box 3",
      "category": "Smaller packaging",
      "description": "Size: 33.7 × 32.2 × 10 cm (weight: up to 2 kg)"
    },
    {
      "title": "Box 4",
      "category": "Smaller packaging",
      "description": "Size: 33.7 × 33.2 × 18 cm (weight: up to 5 kg)"
    },
    {
      "title": "Box 5",
      "category": "Larger packaging",
      "description": "Size: 33.7 × 33.2 × 34.5 cm (weight: up to 10 kg)"
    },
    {
      "title": "Box 6",
      "category": "Larger packaging",
      "description": "Size: 41.7 × 35.9 × 36.9 cm (weight: up to 15 kg)"
    },
    {
      "title": "Box 7",
      "category": "Larger packaging",
      "description": "Size: 48.1 × 40.4 × 38.9 cm (weight: up to 20 kg)"
    },
    {
      "title": "Box 8",
      "category": "Larger packaging",
      "description": "Dimensions: 54.1 × 44.4 × 40.9 cm (thickness: up to 25 kg)"
    },
  ];

  final senderController = TextEditingController();
  final recieverController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go(AppRoutes.shipHome.path);
          },
        ),
        title: Text("Calculate"),
        centerTitle: true,
        backgroundColor: primaryColor400,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [buildDestinationItem(), buildPackagingItem(), buildCategoriesItem()],
            ),
          )),
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
            color: Colors.white,
            alignment: Alignment.center,
            child: TextButton(
                onPressed: () {
                  context.go(AppRoutes.shipCalculated.path);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    fixedSize: Size.fromHeight(60)),
                child: Center(
                    child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 18),
                ))),
          )
        ],
      ),
    );
  }

  Widget buildDestinationItem() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Destination",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "How are you packaging?",
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(.5)),
          ),
          addSpace(15),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(.02), blurRadius: 5, spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(18),
            child: Column(
              children: [
                buildInputField(
                    hint: "Sender location",
                    iconData: Icons.unarchive_outlined,
                    controller: senderController),
                addSpace(15),
                buildInputField(
                    hint: "Receiver location",
                    iconData: Icons.archive_outlined,
                    controller: recieverController),
                addSpace(15),
                buildInputField(
                    hint: "Approx. weight", iconData: Icons.scale, controller: weightController),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildInputField(
      {required String hint,
      required IconData iconData,
      required TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.03), borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
      // margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 25, color: Colors.black.withOpacity(.3)),
          addSpaceWidth(10),
          Container(
            height: 40,
            width: 1,
            color: Colors.black.withOpacity(.1),
          ),
          addSpaceWidth(10),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.black.withOpacity(.3))
                  //fillColor: Colors.amber, filled: true
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPackagingItem() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Packaging",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "How are you packaging?",
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(.5)),
          ),
          addSpace(15),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(.02), blurRadius: 5, spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Image.asset(
                  CustomAssets.package,
                  height: 30,
                  width: 30,
                ),
                addSpaceWidth(10),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.black.withOpacity(.1),
                ),
                addSpaceWidth(10),
                Expanded(
                  child: Text(
                    "Box",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(.7)),
                  ),
                ),
                addSpaceWidth(10),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.black.withOpacity(.4),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategoriesItem() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "What are you sending?",
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(.5)),
          ),
          addSpace(15),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(categoriesOptions.length, (p) {
              bool isActive = selectedCategory == p;
              return GestureDetector(
                onTap: () {
                  setState(() => selectedCategory = isActive ? -1 : p);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(isActive ? 1 : 0),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isActive)
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.check,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      Text(
                        categoriesOptions[p],
                        style: TextStyle(color: isActive ? Colors.white : primaryColor),
                      ),
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
