import 'package:blog_system_app/component/extension_app.dart';
import 'package:blog_system_app/component/text_style_app.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/model/model_list_content_onbording.dart';
import 'package:blog_system_app/view/Screens/StartScreens/onbordingScreen/onbording_pages.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  final List<ModelListContentOnbording> contentListOnbording = [
    ModelListContentOnbording(
      title: "🧠 Unlock the World of PC Hardware!",
      description:
          "Discover the newest Motherboards, CPUs, and Graphics Cards hitting the market. Deep dives and breaking news, all in one place. 💻",
    ),
    ModelListContentOnbording(
      title: "Stay Ahead with Core Hardware News!",
      description:
          "Your single source for the freshest updates on Motherboards, Processors, and Graphics Cards. Don't miss the next big thing! ✨",
    ),
    ModelListContentOnbording(
      title: "Stay Ahead with Core Hardware News!",
      description:
          "Your single source for the freshest updates on Motherboards, Processors, and Graphics Cards. Don't miss the next big thing! ✨",
    ),
  ];

  final List<Widget> _onboardingPages = [
    // Add your onboarding page widgets here
    OnboardingPage(
      imageAsset: [
        Assets.images.cpu.path,
        Assets.images.graphic.path,
        Assets.images.motherBoard.path,
        Assets.images.laptop.path,
      ],
    ),
    OnboardingPage(
      imageAsset: [
        Assets.images.cpu.path,
        Assets.images.graphic.path,
        Assets.images.motherBoard.path,
        Assets.images.laptop.path,
      ],
    ),
    OnboardingPage(
      imageAsset: [
        Assets.images.cpu.path,
        Assets.images.graphic.path,
        Assets.images.motherBoard.path,
        Assets.images.laptop.path,
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 247, 255),

        body: Column(
          children: [
            SizedBox(
              height: size.height / 1.6,
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: _pageController,
                padEnds: true,
                scrollDirection: Axis.horizontal,
                reverse: false,
                physics: const AlwaysScrollableScrollPhysics(),
                children: _onboardingPages,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height / 2.9,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        Text(
                          contentListOnbording[currentPage].title!,
                          style: LightTextStyleApp.textTitleLarge,
                        ),
                        ValueSizes.high.height,
                        Text(
                          contentListOnbording[currentPage].description!,
                          style: LightTextStyleApp.textNamesSmall,
                        ),
                        ValueSizes.ultry.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DotsIndicator(
                              dotsCount: 3,
                              position: currentPage.toDouble(),
                              decorator: DotsDecorator(
                                size: const Size.square(7.0),
                                activeSize: const Size(18.0, 9.0),
                                activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            ValueSizes.verylow.height,
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, RoutsName.routeHomeScreen);
                              },
                              child: Container(
                                height: 45,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 1, 45, 189),
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Start', style: LightTextStyleApp.textSubjectTextStyle),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
