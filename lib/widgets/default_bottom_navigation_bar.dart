import 'package:flutter/material.dart';

class DefaultBottomNavigationBar extends StatelessWidget {
  const DefaultBottomNavigationBar({
    @required this.selectedIndex,
    @required this.onTap,
    Key key,
  })  : assert(selectedIndex != null),
        assert(onTap != null),
        super(key: key);

  final int Function() selectedIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'List packages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        ),
      ],
      currentIndex: selectedIndex(),
      selectedItemColor: Theme.of(context).accentColor,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      onTap: onTap,
    );
  }
}
