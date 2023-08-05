import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:move_mate/src/routes/app_routes.dart';
import 'package:move_mate/src/utils/custom_assets.dart';
import 'package:move_mate/src/utils/gap.dart';
import '../../index_page.dart';

class ShipCalculated extends StatelessWidget {
  const ShipCalculated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              CustomAssets.moveMate,
              height: 100,
            ),
            Image.asset(
              CustomAssets.package,
              height: 150,
            ),
            addSpace(30),
            Text(
              "Total Estimated Amount",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "\$1460 USD",
              style: TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 350,
              child: Text(
                "This amount is estimated and will vary if you change the weight or location",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
              ),
            ),
            addSpace(30),
            TextButton(
                onPressed: () {
                  context.go(AppRoutes.shipHome.path);
                  isHidden.value = false;
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.orange[600],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    fixedSize: Size.fromHeight(60)),
                child: Center(
                    child: Text(
                  "Back to home",
                  style: TextStyle(fontSize: 18),
                )))
          ],
        ),
      ),
    );
  }
}
