import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/data/cart_model.dart';
import 'package:furniture_app/screens/home/category_screen.dart';
import 'package:provider/provider.dart';

import '../../dummy_data.dart';
import '../../utils/color_resources.dart';
import '../../utils/custom_themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  final catList = DUMMY_CATEGORIES;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<CartModel>(context,listen: false);
    return SafeArea(
      child: Container(
        child: RefreshIndicator(
          onRefresh: () async {},
          child: Consumer<CartModel>(
            builder: (context, dataProvider, child){
              return  Container(
                padding: EdgeInsets.all(20),
                color: ColorsResources.PRIMARY_BACKROUND_COLOR,
                child: CustomScrollView(
                  slivers: [
                    //Appbar
                    SliverAppBar(
                      toolbarHeight: 70,
                      expandedHeight: 70,
                      floating: true,
                      stretch: true,
                      elevation: 0,
                      centerTitle: false,
                      automaticallyImplyLeading: false,
                      backgroundColor: ColorsResources.PRIMARY_BACKROUND_COLOR,
                      leading: Image.asset(
                        'assets/icons/logotwo.png',
                        width: 200,
                        height: 80,
                      ),
                    ),
                    SliverPersistentHeader(
                      floating: true,
                      pinned: true,
                      delegate: SliverDelegate(
                        child: Container(
                          padding: EdgeInsets.only(top: 4,bottom: 8),
                          color: ColorsResources.PRIMARY_BACKROUND_COLOR,
                          height: 56,
                          child: TextFormField(
                            onChanged: (value){
                              myProvider.changeSearchCategoryString(value);
                              print('Value is ---> $value');
                            },
                            style: titleRegular.copyWith(fontSize: 18),
                            controller: searchController,
                            decoration: InputDecoration(
                              // contentPadding: const EdgeInsets.all(10.0),
                              alignLabelWithHint: false,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(171, 116, 64, 0.9),
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: ColorsResources.PRIMARY_COLOR,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              labelText: 'Поиск категории',
                              labelStyle: titleRegular,
                              hintStyle: titleRegular,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CategoryScreen(
                                      catId: '${dataProvider.categoryList[index].catId}',
                                      catName: '${dataProvider.categoryList[index].catName}',
                                    )));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      dataProvider.categoryList[index].catImgUrl,
                                      width: double.infinity,
                                      height: 154,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 100,
                                        height: 40,
                                        color: Colors.black54,
                                        child: Center(
                                          child: Text(
                                            dataProvider.categoryList[index].catName,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: dataProvider.categoryList.length,
                        )),
                  ],
                ),
              );
            },
          )
        ),
      ),
    );
  }

  //Header
  Widget builderHeader() {
    return SliverPersistentHeader(
      floating: false,
      pinned: true,
      delegate: SliverDelegate(
        child: Container(
          height: 44,
          child: TextFormField(
            style: titleRegular.copyWith(fontSize: 18),
            controller: searchController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(171, 116, 64, 0.9),
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: ColorsResources.PRIMARY_COLOR,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              labelText: 'Поиск категории',
              labelStyle: titleRegular,
              hintStyle: titleRegular,
            ),
          ),
        ),
      ),
    );
  }

  //List
  Widget builderList() {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 10,
            child: Stack(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/exam_img.png'),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.all(4),
                //   child: Image.asset(
                //     'assets/icons/exam_img.png',
                //     width: double.infinity,
                //     fit: BoxFit.cover,
                //     height: 300,
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.all(4),
                  width: 100,
                  height: 500,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      'BABYLON $index',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        childCount: 100,
      ),
      itemExtent: 50,
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 ||
        oldDelegate.minExtent != 70 ||
        child != oldDelegate.child;
  }
}
