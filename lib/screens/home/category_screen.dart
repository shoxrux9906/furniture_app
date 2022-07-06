import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/data/cart_model.dart';
import 'package:furniture_app/screens/home/product_details_screen.dart';
import 'package:provider/provider.dart';

import '../../data/product.dart';
import '../../utils/color_resources.dart';
import '../../utils/custom_themes.dart';
import 'home_screen.dart';

class CategoryScreen extends StatefulWidget {
  final String catId;
  final String catName;

  CategoryScreen({Key? key, required this.catId, required this.catName})
      : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: ColorsResources.PRIMARY_BACKROUND_COLOR,
        child: Consumer<CartModel>(
          builder: (_, dataProvider, child) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 48,
                  expandedHeight: 48,
                  elevation: 0,
                  title: Text(
                    '${widget.catName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: ColorsResources.PRIMARY_BACKROUND_COLOR,
                  leadingWidth: 24,
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  floating: true,
                  pinned: true,
                  delegate: SliverDelegate(
                    child: Container(
                      padding: EdgeInsets.only(top: 4, bottom: 8),
                      color: ColorsResources.PRIMARY_BACKROUND_COLOR,
                      height: 56,
                      child: TextFormField(
                        style: titleRegular.copyWith(fontSize: 18),
                        controller: searchController,
                        onChanged: (value) {
                          dataProvider.changeSearchProductString(value);
                        },
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
                          labelText: 'Поиск продукта',
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
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          child: Text(
                            '${widget.catName}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                        product:
                                            dataProvider.productList[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        // padding: EdgeInsets.all(4),
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Image.asset(
                                          '${dataProvider.productList[index].image}',
                                          width: double.infinity,
                                          height: 154,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        '${dataProvider.productList[index].name}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '${dataProvider.productList[index].price}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: dataProvider.productList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 4
                                    // mainAxisExtent: 20,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
