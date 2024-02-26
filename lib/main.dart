import 'package:artificial_soft_task/common/app_color.dart';
import 'package:artificial_soft_task/common/page_route.dart';
import 'package:artificial_soft_task/local_storage/cart_hive_model.dart';
import 'package:artificial_soft_task/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartHiveModelAdapter());
  await Hive.openBox<CartHiveModel>('cartItem');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400),
        initialRoute: "/",
        getPages: getPages,
        title: 'Artificial Soft',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
