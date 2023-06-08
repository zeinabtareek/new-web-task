import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/models/Email.dart';
import 'package:outlook/responsive.dart';
import 'package:outlook/screens/email/email_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../common/constants.dart';
import '../../../components/custom_text_field.dart';
import '../controller/home_controller.dart';
import 'email_card.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ListOfItems extends StatelessWidget {
  const ListOfItems({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(
          listOfItems: controller.listOfItems,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        // height: MediaQuery.of(context).size.height,
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // This is our Search bar
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Once user click the menu icon the menu shows like drawer
                        // Also we want to hide this menu icon on desktop

                        if (!Responsive.isDesktop(context))
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                        if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                        Expanded(
                          flex: 2,
                          child: CustomTextField(
                            isSearch: true,
                            text: "Search",
                            onChanged: (String c) {},
                          ),
                        ),
                      if(controller.services.auth.currentUser!=null)

                          IconButton(
                              onPressed: () {
                                  if (controller.services.auth.currentUser !=
                                      null) {controller.logOut(context);
                                    print('logged out');
                                  } else {
                                    Get.defaultDialog(
                                        title: 'error'.tr,
                                        content: Text('no_account'.tr));}
                                },
                                icon: Icon(Icons.logout))

                      ],
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Image.asset("assets/images/ads.png"),
                  SizedBox(height: kDefaultPadding),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Row(
                      children: [
                        WebsafeSvg.asset(
                          "assets/Icons/Angle down.svg",
                          width: 16,
                        ),
                        SizedBox(height: kDefaultPadding / 3),
                        Text(
                          "Sort by date",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        MaterialButton(
                          minWidth: 20,
                          onPressed: () {},
                          child: WebsafeSvg.asset(
                            "assets/Icons/Sort.svg",
                            width: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: EmailCard(
                          isActive: false,
                          list: emails,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EmailScreen(email: emails[0]),
                              ),
                            );
                          },
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        // if (Responsive.isTablet(context))
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 1.8,
                            // width: 100,
                            child: EmailScreen(),
                          ),
                        ),
                    ],
                  ),
                  if (Responsive.isMobile(context)) EmailScreen(),
                ]),
          ),
        ),
      ),
    );
  }
}
