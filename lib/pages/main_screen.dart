import 'package:easy_localization/easy_localization.dart';
import 'package:alubian/config/extension.dart';
import 'package:alubian/config/lang/generated/locale_keys.g.dart';
import 'package:alubian/pages/cart/cart.dart';
import 'package:alubian/pages/profile/profile.dart';
import 'package:alubian/pages/shop/shop.dart';

import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
  static const id = '/home';
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> _navItems = <Widget>[
    const Shop(),
    const Cart(),
    const Profile(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navBars = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.shopping_cart),
      label: LocaleKeys.common_nav_shop.tr().toTitleCase(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.shopping_bag),
      label: LocaleKeys.common_nav_bag.tr().toTitleCase(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.person),
      label: LocaleKeys.common_nav_profile.tr().toTitleCase(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _navItems,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: _navBars),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
