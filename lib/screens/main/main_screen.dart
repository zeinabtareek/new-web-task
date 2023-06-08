import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/responsive.dart';
import 'components/list_of_emails.dart';
import 'controller/home_controller.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: ListOfItems(),
        tablet: Wrap(
          children: [
            Container(
              height: _size.height,
              child: ListOfItems(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 1 : 4,
              child: SideMenu(
                listOfItems: controller.listOfItems,
              ),
            ),
            Expanded(
              flex: _size.width > 1340 ? 5 : 8,
              child: ListOfItems(),
            ),
          ],
        ),
      ),
    );
  }
}
