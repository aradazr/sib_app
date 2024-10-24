import 'package:flutter/material.dart';

class ListTileItems extends StatelessWidget {
  const ListTileItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        tileColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Image.asset(
            'assets/images/setting.png',
            height: 25,
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset(
            'assets/images/white_double_arrow.png',
            height: 15,
          ),
        ),
        title: Text(
          'تنظیمات',
        ),
        titleTextStyle: TextStyle(fontFamily: 'shbold', fontSize: 15),
      ),
    );
  }
}