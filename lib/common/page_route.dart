import 'package:artificial_soft_task/view/cart_screen.dart';
import 'package:artificial_soft_task/view/home_screen.dart';
import 'package:artificial_soft_task/view/product_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../main.dart';

var getPages = [
  GetPage(name: "/", page: () => const MyApp()),
  GetPage(name: "/products", page: () =>  ProductScreen()),

  GetPage(name: "/home", page: () => const HomeScreen()),
  GetPage(name: "/cart", page: () => const CartScreen()),
  
  // GetPage(name: "/homeScreen", page: () => HomeScreen()),
  // GetPage(name: "/profileScreen", page: () => ProfileScreen()),
  // GetPage(name: "/attendanceScreen", page: () => AttendanceScreen()),
];
