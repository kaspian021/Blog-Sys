import 'dart:io';
import 'package:blog_system_app/component/service.dart';
import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/controller/Main_Screens/Articles/article_write_controller.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/model/tags_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleWriteScreen extends StatefulWidget {
  const ArticleWriteScreen({super.key});

  @override
  State<ArticleWriteScreen> createState() => _ArticleWriteScreenState();
}

class _ArticleWriteScreenState extends State<ArticleWriteScreen> {
  List tagArticleList = [];

  final controller = Get.put(
    ArticleWriteController(),
  ); //TODO later must to Find convert

  @override
  Widget build(BuildContext context) {
    final sizeBody = MediaQuery.of(context).size.width / 10;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              //appBar_ArticleWrite
              Padding(
                padding: EdgeInsets.only(
                  left: sizeBody,
                  right: sizeBody,
                  top: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('New Article', style: FontSized.fontLarg),
                    ),
                    IconButton(
                      onPressed: () {
                        //Upload_Articl_write to Server
                      },
                      icon: const Icon(Icons.file_upload_outlined, size: 35),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //subject Article
              Padding(
                padding: EdgeInsets.only(left: sizeBody, right: sizeBody),
                child: TextField(
                  style: FontSized.fontMediumLarg,
                  decoration: InputDecoration(
                    hintText: 'subject Article',
                    hintStyle: FontSized.fontMedium,
                  ),
                ),
              ),
              const SizedBox(height: 40),
          
              //image in Article Write with filePicker
              SelectImageContainer(controller: controller),
          
              //Article write Content to Screen Write
              Padding(
                padding: EdgeInsets.only(
                  left: sizeBody - 10,
                  right: sizeBody - 10,
                  top: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    //to Screen Write
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
          
                    child: Row(
                      children: [
                        Expanded(child: Text('Add Article Content', style: FontSized.fontMedium)),
                        const Icon(
                            Icons.edit,
                            color: ColorsConst.colorPrimery,
                            size: 25,
                          ),
                          const SizedBox(width: 30,)
                          
                        
                      ],
                    ),
                  ),
                ),
              ),
          
              const Divider(color: ColorsConst.colorDivider, thickness: 3,indent: 40,endIndent:40,height: 0,),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(
                  left: sizeBody,
                  right: sizeBody - 10,
                  
                ),
                child: Text(ConstText.concetArticleWrite,style: FontSized.fontLow,),
              ),
              const SizedBox(height: 10),
              //open bottomSheet for select tags
              Padding(
                padding: EdgeInsets.only(
                  left: sizeBody - 10,
                  right: sizeBody - 10,
                  top: 10,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      //show_dialog_BottomSheet
                      dialogTags();
                    },
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Add Tags",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Avenir',
                              color: ColorsConst.colorPrimery,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.edit,
                          color: ColorsConst.colorPrimery,
                          size: 25,
                        ),
                        SizedBox(width: 30,)
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(color: ColorsConst.colorDivider, thickness: 3,indent: 40,endIndent:40,height: 0,),
              const SizedBox(height: 10),
              
              //tag_ Article
              Padding(
                padding: EdgeInsets.only(
                  left: sizeBody - 10,
                  right: sizeBody - 10,
                  top: 5,
                ),
                child: SizedBox(
                  height: Get.height / 5,
                  width: Get.width,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
          
                    itemCount: tagArticleList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .55,
                    ),
                    itemBuilder: (context, index) {
                      return listTagsArticle(index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTagsArticle(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 10),
      child: Container(
        height: Get.height / 5,

        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorsConst.colorPrimery),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            Text(
              tagArticleList[index],
              style: FontSized.fontLow,
            ), //tag_article in Screen

            IconButton(
              onPressed: () {
                //delete tag in Screen
                setState(() {
                  tagArticleList.removeAt(index);
                });
              },
              icon: const Icon(Icons.cancel_rounded, size: 30),
            ),
          ],
        ),
      ),
    );
  }

  dialogTags() {
    return Get.bottomSheet(
      elevation: 10,
      ignoreSafeArea: true,

      Container(
        height: Get.height / 3.1,

        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.white38)],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SizedBox(
          height: Get.height / 10,
          child: ListView.builder(
            itemCount: TagsAdd.addTags.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var item = TagsAdd.addTags[index];
              return Padding(
                padding: EdgeInsets.only(
                  top: Get.height / 7.5,
                  bottom: Get.height / 7.5,
                  left: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    //add_tags_tagArticleList
                    setState(() {
                      if (tagArticleList.length >= 4) {
                        Get.snackbar(
                          'Error',
                          'max tags',
                          colorText: Colors.red,
                        );
                      } else {
                        if (!tagArticleList.contains(item)) {
                          tagArticleList.add(item);
                        } else {
                          Get.snackbar(
                            'ops!!',
                            'You have already added this tag($item)',
                            colorText: Colors.red,
                          );
                        }
                      }
                    });
                  },
                  child: Container(
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                      alignment: Alignment.center,

                      child: Text(
                        TagsAdd.addTags[index], //tags in Articles Write
                        style: FontSized.fontLow,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SelectImageContainer extends StatelessWidget {
  const SelectImageContainer({super.key, required this.controller});

  final ArticleWriteController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          //to select image for photo in Article Write
          SelectFile().selectImageFile();
        },
        child: Stack(
          children: [
            Container(
              height: Get.height / 3.7,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image:
                      !controller.selectImage.value
                          ? AssetImage(Assets.images.imageDefaultArticle.path)
                          : FileImage(
                            File(controller.fileImage.path!),
                            scale: 1,
                          ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned.fill(
              child: Icon(
                controller.selectImage.value ? null : Icons.image_outlined,
                size: 70,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
