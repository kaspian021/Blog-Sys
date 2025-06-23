
import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/controller/Main_Screens/home_controller.dart';
import 'package:blog_system_app/controller/Register/check_login_controller.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Articles/article_screen.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Articles/article_write_screen.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Home/drawer_widget.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CurrentScreen {

  static const home= 0;
  static const article= 1;
  static const writeArticle= 2;
  static const search= 3;

} 

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  

  final List<int> routeHistory= [CurrentScreen.home];

  int selectIndex = CurrentScreen.home;

  final GlobalKey<ScaffoldState> _keyGlobal = GlobalKey();

  final GlobalKey<NavigatorState> _keyHome = GlobalKey();
  final GlobalKey<NavigatorState> _keyArticle = GlobalKey();
  final GlobalKey<NavigatorState> _keyWriteArticle = GlobalKey();
  final GlobalKey<NavigatorState> _keySearch = GlobalKey();


  late final map= {

    CurrentScreen.home: _keyHome, 
    CurrentScreen.article: _keyArticle, 
    CurrentScreen.writeArticle: _keyWriteArticle, 
    CurrentScreen.search: _keySearch, 

  };

  Future<bool> _onWillPop()async{

    if(map[selectIndex]!.currentState!.canPop()){

      map[selectIndex]!.currentState!.pop();
    }else if(routeHistory.length>1){

      routeHistory.removeLast();
      selectIndex=routeHistory.last;

    }


    return false;
  }

  @override
  void initState()async {
    
    await CheckLoginController.checkedLogin(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          drawerEdgeDragWidth: ValueSizes.veryhigh,
          key: _keyGlobal,
          drawerEnableOpenDragGesture: false,
          endDrawerEnableOpenDragGesture: true,
          
          drawerScrimColor: Colors.black,
          //Drawer programm
          endDrawer: const DrawerBlogSys(),
      
          //bottomNavigationBar
          bottomNavigationBar: BottomNavigationBlogSys(
            selectIndex: selectIndex,
            selectScreen: (p0) {
              setState(() {
                selectIndex=p0;
              });
            },
            keyGlobal: _keyGlobal,
          ),
      
          body:IndexedStack(
              index: selectIndex,
      
              children: [
                HomePage(),
                ArticleScreen(),
                const ArticleWriteScreen()
              ],
            ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BottomNavigationBlogSys extends StatelessWidget {
  BottomNavigationBlogSys({
    super.key,
    required GlobalKey<ScaffoldState> keyGlobal,
    required this.selectScreen,
    required this.selectIndex,
    
  }) : _keyGlobal = keyGlobal;

  final Function(int) selectScreen;
  final GlobalKey<ScaffoldState> _keyGlobal;
  final int  selectIndex;

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height / 9.90,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: ValueSizes.medium)],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: ()=> selectScreen(CurrentScreen.home),
                   

                  icon: Icon(
                    Icons.home_sharp,
                    size: 30,
                    color:
                         selectIndex!= 0
                            ? Colors.black
                            : Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: ()=> selectScreen(CurrentScreen.article),
                  icon: Icon(
                    Icons.article_rounded,
                    size: 30,
                    color:
                        selectIndex== 1
                            ? Colors.blue
                            : Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //if user islogin==true and isSeller => to write ArticleScreen

                    if (controller.isSeller.value) {
                     selectScreen(CurrentScreen.writeArticle);
                    } else {
                      //to details permissionsScreen
                      Get.snackbar(
                        'Error',
                        'You need permissions to enter this section.',
                        colorText: Colors.red,
                        mainButton: TextButton(
                          onPressed: () {

                            //TODO permissionsScreen
                            
                          },
                          child: const Text('see more details'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: Get.height / ValueSizes.high,
                    width: Get.height / ValueSizes.high,
                    decoration: BoxDecoration(
                      color: controller.isSeller.value? ColorsConst.colorPrimery: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child:  controller.isSeller.value? const Icon(Icons.add, size: 35, color:  Colors.white):const Icon(Icons.close, size: 35, color:  Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: ()=> selectScreen(CurrentScreen.search),
                  icon: Icon(
                    Icons.search_rounded,
                    size: 30,
                    color:
                        selectIndex== 3
                            ? Colors.blue
                            : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    
                    _keyGlobal.currentState!.openEndDrawer();
                  },
                  icon: const Icon(Icons.menu, size: 30, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
