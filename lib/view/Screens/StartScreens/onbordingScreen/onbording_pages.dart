
import 'package:blog_system_app/controller/Animation_controller/onbording_animation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingPage extends StatefulWidget {

  final List imageAsset;
  const OnboardingPage({
    super.key,

    required this.imageAsset, 

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
    
    //animations 
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