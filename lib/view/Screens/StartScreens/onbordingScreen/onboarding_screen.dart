
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/view/Screens/StartScreens/onbordingScreen/onbording_pages.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  

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


