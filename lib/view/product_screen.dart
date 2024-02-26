import 'package:artificial_soft_task/common/app_color.dart';
import 'package:artificial_soft_task/controller/product_controller.dart';
import 'package:artificial_soft_task/local_storage/cart_hive_model.dart';
import 'package:artificial_soft_task/widget/custom_appbar.dart';

import 'package:artificial_soft_task/widget/custom_card_tile.dart';
import 'package:artificial_soft_task/widget/custom_dialog.dart';
import 'package:artificial_soft_task/widget/custom_progress_indicator.dart';
import 'package:artificial_soft_task/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  Box<CartHiveModel> cartItemBox = Hive.box<CartHiveModel>('cartItem');

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      //------------------------Category Filter-----------//
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customDialog(title: "Categories", content: '', actions: [
            for (int i = 0; i < productsList.length; i++)
              GestureDetector(
                  onTap: () {
                    categoryName.value =
                        productsList[i].categoryName.toString();
                    controller.getCategoryWiseProduct(
                        categoryName: categoryName.value);
                    Get.back();
                  },
                  child: Obx(
                    () => Card(
                      color: categoryName.value == productsList[i].categoryName
                          ? btnClr
                          : kSecondaryColor,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text(productsList[i].categoryName.toString()),
                          ),
                        ],
                      ),
                    ),
                  )),
          ]);
        },
        backgroundColor: kSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Icon(Icons.category_outlined),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const CustomProgressIndicator()
            : Container(
                height: size.height,
                width: size.width,
                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: productListData.length,
                          itemBuilder: ((context, index) {
                            var item = productListData[index];
                            return CustomCardTile(
                              bgColor: kSecondaryColor,
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${item.productName}'),
                                  const Divider(
                                    height: 1.0,
                                    thickness: 0.1,
                                    color: kPrimaryColor,
                                  ),
                                  Text('$categoryName'),
                                ],
                              ),
                              //------------------------------add to cart--------------------//
                              trailing: GestureDetector(
                                onTap: () async {
                                  CartHiveModel cartItem = CartHiveModel(
                                    categoryName: categoryName.value,
                                    productName: item.productName.toString(),
                                    productId: item.id,
                                  );

                                  if (cartItemBox.values.isNotEmpty) {
                                    int a = 0;
                                    for (var i in cartItemBox.values.toList()) {
                                      if (i.productId == item.id) {
                                        a++;
                                        break;
                                      }
                                    }
                                    if (a != 0) {
                                      customSnackBar(
                                          bgClr: Colors.red,
                                          msg: 'AllReady Added');
                                    } else {
                                      customSnackBar(
                                          bgClr: Colors.green,
                                          msg: 'Successfully Added');
                                      cartItemBox.add(cartItem);
                                    }
                                  } else {
                                    cartItemBox.add(cartItem);
                                  }
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: kPrimaryColor,
                                  size: 30.0,
                                ),
                              ),
                            );
                          })),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
