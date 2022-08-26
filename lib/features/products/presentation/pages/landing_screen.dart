import 'package:devera_do_an_cuoi_khoa/features/account/presentation/pages/account_user_info.dart';
import 'package:flutter/material.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/domain/entities/cache_user.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/entities/user.dart';

class LandingPage extends StatefulWidget {
  final bool isFromCache;
  final String? userImg;
  final UserEntities? loggedUser;
  final CacheUserEntities? cachedUser;

  const LandingPage({Key? key, required this.isFromCache, this.cachedUser, this.loggedUser, this.userImg}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;
  List<Widget> _children() => [
    Center(child: Text('Food'),),
    Center(child: Text('Chat'),),
    Center(child: Text('Cart'),),
    UserInfoScreen(
      isFromCache: widget.isFromCache,
      loggedUser: widget.loggedUser,
      cachedUser: widget.cachedUser,
      userImg: widget.userImg,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _children();

    return Scaffold(
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: "Account",
          ),
        ],
      ),
    );
  }
}

