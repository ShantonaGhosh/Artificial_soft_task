import 'package:artificial_soft_task/common/app_color.dart';
import 'package:artificial_soft_task/controller/cart_controller.dart';

import 'package:artificial_soft_task/widget/custom_appbar.dart';
import 'package:artificial_soft_task/widget/custom_card_tile.dart';
import 'package:artificial_soft_task/widget/custom_snackbar.dart';

import 'package:artificial_soft_task/widget/my_text_style.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: const CustomAppBar(
          title: Text('Cart'),
        ),
        body: Obx(
          () => controller.cartData.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Cart item is Empty',
                    style: myTextStyle(size: 18.0, clr: Colors.white),
                  ),
                )
              : Container(
                  height: size.height,
                  width: size.width,
                  padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 0.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.cartData.length,
                      itemBuilder: ((context, index) {
                        var item = controller.cartData[index];
                        return CustomCardTile(
                          bgColor: kSecondaryColor,
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${item.productName}'),
                              const Divider(
                                height: 1.0,
                                thickness: 0.4,
                                color: kPrimaryColor,
                              ),
                              Text('${item.categoryName}'),
                            ],
                          ),
                          //-----------cart data delete in hive-------------------------//
                          trailing: GestureDetector(
                            onTap: () async {
                              var data = controller.cartItemBox.values.toList();
                              for (var i = 0; i < data.length; i++) {
                                if (controller.cartItemBox.getAt(i) == item) {
                                  await controller.cartItemBox.deleteAt(i);
                                  controller.getCartList();
                                  customSnackBar(
                                      bgClr: Colors.green,
                                      msg: 'Delete Successfully');
                                  break;
                                }
                              }
                            },
                            child: const Icon(
                              Icons.delete_forever_outlined,
                              color: kPrimaryColor,
                              size: 30.0,
                            ),
                          ),
                        );
                      })),
                ),
        ));
  }
}
