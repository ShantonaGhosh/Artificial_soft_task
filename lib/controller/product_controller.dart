import 'package:artificial_soft_task/model/category_wise_product_model.dart';
import 'package:artificial_soft_task/service/category_service.dart';

import 'package:artificial_soft_task/service/product_service.dart';
import 'package:get/get.dart';

RxBool isDataLoaded = false.obs;
List<Products> productListData = [];
var productsList = <CategoryWiseProductsModel>[].obs;
var categoryName = ''.obs;

class ProductController extends GetxController {
  var isLoading = false.obs;
  var isInternetStable = false.obs;
  @override
  void onInit() {
    super.onInit();
    if (!isDataLoaded.value) {
      getProductCategory();
    }
  }

  Future getProductCategory() async {
    isLoading(true);
    var data = await CategorysService.getCategorys();
    if (data.isNotEmpty) {
      productsList.clear();
      for (var i in data.toList()) {
        var item = await ProductsServies.getProducts(id: i.id!);
        productListData = [];
        for (var j in item.toList()) {
          Products products = Products(id: j.id, productName: j.productName);
          productListData.add(products);
        }
        CategoryWiseProductsModel categoryWiseProductsModel =
            CategoryWiseProductsModel(
                categoryId: i.id,
                categoryName: i.categoryName,
                products: productListData);
        productsList.add(categoryWiseProductsModel);
      }
      isDataLoaded.value = true;
    }
    categoryName.value = productsList.first.categoryName.toString();
    getCategoryWiseProduct(
        categoryName: productsList.first.categoryName.toString());
    isLoading.value = false;
  }

  getCategoryWiseProduct({required String categoryName}) {
    isLoading.value = true;

    productListData = [];
    for (var h in productsList) {
      if (categoryName == h.categoryName) {
        productListData.addAll(h.products!.toList());
      }
    }
    isLoading.value = false;
  }
}
