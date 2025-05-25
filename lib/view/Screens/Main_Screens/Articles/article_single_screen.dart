
import 'package:blog_system_app/component/elements.dart';
import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/controller/Main_Screens/article_controller.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/model/model_home_new_articles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ArticleSingleScreen extends StatelessWidget {
  late final ModelHomeNewArticles modelHomeNewArticles;
  final controller = Get.find<ArticleController>();

  final box = GetStorage();

  ArticleSingleScreen({super.key}) {
    modelHomeNewArticles = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    var sizeBody = MediaQuery.of(context).size.width / 10;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  //appBar ScreenArticleSingle
                  Padding(
                    padding: EdgeInsets.only(
                      left: sizeBody,
                      right: sizeBody,
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         IconButton( onPressed: () { 

                          Get.back();
                         }, icon: const Icon(Icons.arrow_back_ios_new_rounded),),
                        PullDownButton(
                          itemBuilder:
                              (context) => [
                                PullDownMenuItem(onTap: () {}, title: 'copy',),
                              ],
                          buttonBuilder: (context, showMenu) {
                            return IconButton(
                              onPressed: () => showMenu,
                              icon: const Icon(CupertinoIcons.ellipsis),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  //TitleArticleSingle
                  Padding(
                    padding: EdgeInsets.only(
                      left: sizeBody,
                      right: sizeBody,
                      top: 20,
                    ),
                    child: Text(
                      modelHomeNewArticles.title!,
                      style: FontSized.fontMedium,
                    ),
                  ),

                  //save and share Post, and viewProfile User
                  Padding(
                    padding: EdgeInsets.only(
                      left: sizeBody,
                      right: sizeBody,
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //imageProfileUser author
                            Container(
                              height: Get.height / 23,
                              width: Get.width / 11,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                  image: AssetImage(Assets.images.laptop.path),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            const SizedBox(width: 15),

                            //userName author and date write Article
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  modelHomeNewArticles.author!,
                                  style: FontSized.fontLow,
                                ), //userName author test,
                                const SizedBox(height: 3),
                                Text(
                                  modelHomeNewArticles.createdAt ?? 'null',
                                  style: FontSized.fontVeryLow,
                                ), //date Write
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            //share with sharePluse
                            IconButton(
                              onPressed: () {
                                //sharePluse
                              },
                              icon: ImageIcon(
                                Assets.icons.vector.provider(),
                                color: ColorsConst.colorPrimery,
                                size: 18,
                              ),
                            ),
                            //save Sql article to profile forward
                            IconButton(
                              onPressed: () {
                                //save_Hive
                              },
                              icon: const Icon(
                                Icons.bookmark_outline_outlined,
                                color: ColorsConst.colorPrimery,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  //Article_image
                  CachedNetworkImage(
                    imageUrl: modelHomeNewArticles.image!,

                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: Get.height / 3.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      );
                    },

                    placeholder: (context, url) => loading(),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.image),
                  ),
                  const SizedBox(height: 15),
                  //Article_content
                  Obx(
                    () =>
                        controller.contentArticleSingle.value.content != null
                            ? Padding(
                              padding: EdgeInsets.only(
                                left: sizeBody,
                                right: sizeBody,
                              ),
                              child: Text(
                                controller.contentArticleSingle.value.content!,
                                style: FontSized.fontLow,
                              ),
                            )
                            : loading(),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
            Positioned(
              height: Get.height / 9,
              bottom: 0,

              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  
                  gradient: LinearGradient(
                    colors: ColorsConst.bottomNavigationLikeArticle,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: LikeArticleContainer(
                  sizeBody: sizeBody,
                ), //class animation like Article
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
