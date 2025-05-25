
import 'package:blog_system_app/controller/Animation_controller/onbording_animation_screen.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/view/route_Screen/routs_name.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  final List<Widget> _onboardingPages = [
    // Add your onboarding page widgets here
    OnboardingPage(
      title: "🧠 Unlock the World of PC Hardware!",
      description:
          "Discover the newest Motherboards, CPUs, and Graphics Cards hitting the market. Deep dives and breaking news, all in one place. 💻",
      imageAsset: [
        Assets.images.cpu.path,
        Assets.images.graphic.path,
        Assets.images.motherBoard.path,
        Assets.images.laptop.path,
      ],
      currentPage: 0
    ),
    OnboardingPage(
      title: "Stay Ahead with Core Hardware News!",
      description:
          "Your single source for the freshest updates on Motherboards, Processors, and Graphics Cards. Don't miss the next big thing! ✨",
      imageAsset: [
        Assets.images.cpu.path,
        Assets.images.graphic.path,
        Assets.images.motherBoard.path,
        Assets.images.laptop.path,
      ], currentPage: 1,
    ),
    OnboardingPage(
      title: "Stay Ahead with Core Hardware News!",
      description:
          "Your single source for the freshest updates on Motherboards, Processors, and Graphics Cards. Don't miss the next big thing! ✨",
      imageAsset: [
        Assets.images.cpu.path,
        Assets.images.graphic.path,
        Assets.images.motherBoard.path,
        Assets.images.laptop.path,
      ], currentPage: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 247, 255),

        body: PageView(

          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              currentPage = page;
            });
          },
          padEnds: true,
          scrollDirection: Axis.horizontal,
          reverse: false,
          physics: const AlwaysScrollableScrollPhysics(),
          children: _onboardingPages,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OnboardingPage extends StatefulWidget {
  final String title;
  final String description;
  final List imageAsset;
  int currentPage;
  OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset, 
    required this.currentPage,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    //Animations_controller
    OnbordingAnimationScreen.controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    
    OnbordingAnimationScreen.photoAnimationTopLeft = Tween<Offset>(
      begin: const Offset(.5, -1.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: OnbordingAnimationScreen.controller, curve: Curves.bounceOut));
    OnbordingAnimationScreen.photoAnimationTopRight = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: OnbordingAnimationScreen.controller, curve: Curves.bounceOut));
    OnbordingAnimationScreen.photoAnimationBottomLeft = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: OnbordingAnimationScreen.controller, curve: Curves.bounceOut));
    OnbordingAnimationScreen.photoAnimationBottomRight = Tween<Offset>(
      begin: const Offset(-.5, 1.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: OnbordingAnimationScreen.controller, curve: Curves.bounceOut));

    OnbordingAnimationScreen.controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textstyle = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(height: Get.height / 7.5),
        Center(
          child: Container(
            height: Get.height / 2.44,
            width: Get.width / 1.27,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  children: [
                    SlideTransition(
                      position: OnbordingAnimationScreen.photoAnimationTopLeft,
                      child: Container(
                        height: Get.height / 5.1,
                        width: Get.width / 4,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Colors.black54,
                              offset: Offset(0, 8),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(widget.imageAsset[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SlideTransition(
                      position: OnbordingAnimationScreen.photoAnimationTopRight,
                      child: Container(
                        height: Get.height / 5.1,
                        width: Get.width / 1.97,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Colors.black54,
                              offset: Offset(0, 8),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(widget.imageAsset[1]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SlideTransition(
                      position: OnbordingAnimationScreen.photoAnimationBottomLeft,
                      child: Container(
                        height: Get.height / 5.1,
                        width: Get.width / 1.97,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Colors.black54,
                              offset: Offset(0, 8),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(widget.imageAsset[2]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SlideTransition(
                      position: OnbordingAnimationScreen.photoAnimationBottomRight,
                      child: Container(
                        height: Get.height / 5.1,
                        width: Get.width / 4,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Colors.black54,
                              offset: Offset(0, 8),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(widget.imageAsset[3]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height / 2.9,
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
                      widget.title,
                      style: textstyle.bodyLarge,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.description,
                      style: textstyle.bodySmall,
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DotsIndicator(
                  dotsCount: 3,
                  position: widget.currentPage.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(7.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                GestureDetector(
                  onTap: () {
                    Get.offAndToNamed(RoutsName.routeHomeScreen);
                  },
                  child: Container(
                    height: 45,
                    width: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 1, 45, 189),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                  
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Start',style: textstyle.bodyMedium,),
                        const Icon(Icons.arrow_forward,color: Colors.white,size: 20,),
                      ],
                    )
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
    );
  }

  @override
  void deactivate() {
    
    if(OnbordingAnimationScreen.photoAnimationTopLeft.isCompleted){
      OnbordingAnimationScreen.controller.dispose();
    }

    super.deactivate();
  }
  
  
}
