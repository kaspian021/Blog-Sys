

import 'package:blog_system_app/component/extension_app.dart';
import 'package:blog_system_app/service/service_tools.dart';
import 'package:blog_system_app/component/text_style_app.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/controller/Main_Screens/profile_controller.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controllerHome = Get.find<ProfileController>();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {

    var sizebody = MediaQuery.of(context).size.width / ValueSizes.high;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(left: sizebody, right: sizebody - 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(
                      child: Text('profile', style: LightTextStyleApp.textTitleLarge),
                    ),
                    //menu_Bar_pullDown
                    PullDownButton(
                      itemBuilder:
                          (context) => [
                            PullDownMenuItem(
                              onTap: () {},
                              title: 'Chenge UserName',
                              itemTheme: const PullDownMenuItemTheme(
                                textStyle: LightTextStyleApp.textSubjectTextStyle,
                              ),
                            ),
                          ],
                      buttonBuilder:
                          (context, showMenu) => CupertinoButton(
                            onPressed: showMenu,
                            child: const Icon(
                              CupertinoIcons.ellipsis,
                              color: Colors.black,
                            ),
                          ),
                    ),
                  ],
                ),
              ),
              //Specifications User
              SizedBox(
                height: Get.height / 2.3,
                width: Get.width / 1.27,

                child: Stack(
                  children: [
                    Container(
                      height: Get.height / 2.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 4.2),
                        ],
                        borderRadius: BorderRadius.circular(ValueSizes.veryhigh),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: sizebody,
                          right: sizebody,
                          top: sizebody - ValueSizes.veryhigh,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: Get.width / 5.54,

                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    ),

                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: Get.height / 160.94,
                                      left: Get.width / 70.94,
                                      bottom: Get.height / 160.94,
                                      right: Get.width / 70.94,
                                    ),
                                    child: Container(
                                      height: Get.height / 11.94,
                                      width: Get.width / 6.94,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(17),
                                        image:
                                            controllerHome.hasPhotoProfile.value
                                                ? DecorationImage(
                                                  image: AssetImage(
                                                    Assets
                                                        .images
                                                        .graphic
                                                        .path, //image person user
                                                  ),
                                                  fit: BoxFit.cover,
                                                )
                                                : null,
                                      ),
                                      child: const Icon(
                                        Icons.image,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${box.read(SaveToken.email)}", //email user
                                      style: LightTextStyleApp.textNamesSmall,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "@${box.read(SaveToken.userName)}",
                                      style: LightTextStyleApp.textSubjectDarkTextStyle,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Digikala",
                                      style: LightTextStyleApp.textNamesSmall,
                                    ), //user name Seller bisines
                                  ],
                                ),
                              ],
                            ),
                            ValueSizes.veryhigh.height,
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'About me',
                                style: LightTextStyleApp.textLableandTitleTextStyle,
                              ),
                            ),
                            ValueSizes.medium.height,
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Madison Blackstone is a director of user experience design, with experience managing global teams.', // text AboutMe profile user
                                style: LightTextStyleApp.textNamesSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //census enblad user
                    Positioned(
                      top: Get.height / 3,
                      right: Get.width / 11,
                      child: Container(
                        height: Get.height / 11.94,
                        width: Get.width / 1.62,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black87,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(0, 26),
                              blurRadius: 27,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
