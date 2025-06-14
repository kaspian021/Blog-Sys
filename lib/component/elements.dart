import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


//loading widget for subprocess
Widget loading() {
  return const SpinKitCircle(
    color: Colors.blue,
    size: 30,
    duration: Duration(milliseconds: 300),
  );
}

class WidgetsAndVariableStatic {

  WidgetsAndVariableStatic._();

  static final box= GetStorage();

}

//like article animation for read Screen in Articles 
class LikeArticleContainer extends StatefulWidget {
  const LikeArticleContainer({super.key, required this.sizeBody});

  final double sizeBody;

  @override
  State<LikeArticleContainer> createState() => _LikeArticleContainerState();
}

class _LikeArticleContainerState extends State<LikeArticleContainer>
    with TickerProviderStateMixin {
  //animationcontroller
  late AnimationController animationControllerContainer;
  late AnimationController animationControllerLike;

  //animations with ContainerLike
  late Animation<double> animationScaleContainer;

  //animation with like
  late Animation<double> animationTransformLike;
  late Animation<double> animationscaleLike;
  bool islike = false;

  @override
  void initState() {
    animationControllerContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animationControllerLike = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    //animations with ContainerLike
    animationScaleContainer = Tween<double>(begin: .9, end: .3).animate(
      CurvedAnimation(
        parent: animationControllerContainer,
        curve: Curves.easeInCirc,
      ),
    );

    //animation with like
    animationTransformLike = Tween<double>(begin: 0, end: -1).animate(
      CurvedAnimation(
        parent: animationControllerLike,
        curve: Curves.easeInOutExpo,
      ),
    );
    animationscaleLike = Tween<double>(begin: .8, end: 1.1).animate(
      CurvedAnimation(
        parent: animationControllerLike,
        curve: Curves.easeInOutCubic,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.sizeBody * 6.3,
        right: widget.sizeBody,
        top: Get.height / 100,
        bottom: widget.sizeBody - 7,
      ),
      child: AnimatedBuilder(
        builder: (context, widgetChild) {
          return GestureDetector(
            onTap: () {
              animationControllerContainer.forward();
              animationScaleContainer.addStatusListener((listener) {
                if (listener.isCompleted) {
                  animationControllerContainer.reverse();
                }
              });
              animationScaleContainer.addStatusListener((listener) {
                if (listener.isCompleted) {
                  animationControllerLike.forward();
                  animationControllerLike.addStatusListener((listener) {
                    if (listener.isCompleted) {
                      animationControllerLike.reverse();
                    }
                  });
                }
              });
              //toggle islike in animation like
              if (islike) {
                islike = false;
              } else {
                islike = true;
              }
            },
            child: ScaleTransition(
              scale: animationScaleContainer,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorsConst.colorPrimery,
                  boxShadow: const [
                    BoxShadow(color: Colors.black54, blurRadius: 10),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: animationTransformLike.value,
                      child: ScaleTransition(
                        scale: animationscaleLike,
                        child:
                            !animationControllerContainer.isCompleted && !islike
                                ? ImageIcon(
                                  Assets.icons.like.provider(),
                                  color: Colors.white,
                                )
                                : ImageIcon(
                                  Assets.icons.likeback.provider(),
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text('2.5k', style: FontSized.fontLowWhite), //likeArticle
                  ],
                ),
              ),
            ),
          );
        },
        animation: animationControllerLike,
      ),
    );
  }

  @override
  void dispose() {
    animationControllerContainer.dispose();
    animationControllerLike.dispose();
    super.dispose();
  }
}


