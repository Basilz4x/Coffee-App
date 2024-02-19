import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBottomNavigatorBar extends ConsumerWidget {
  const AppBottomNavigatorBar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cureentIndex = ref.watch(bottomNavigatorIndexProvider);
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        color: AppColor.mainColor,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
                currentIndex: cureentIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: AppColor.textColor,
                selectedItemColor: AppColor.iconsColor,
                elevation: 0,
                backgroundColor: AppColor.secondaryColor,
                onTap: (index) {
                  Utils.changeTap(index, context, ref);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 30,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 28,
                      ),
                      label: "Cart"),
                ]),
          ),
        ),
      ),
    );
  }
}

final bottomNavigatorIndexProvider = StateProvider<int>((ref) => 0);
