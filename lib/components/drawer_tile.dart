import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    this.icon = Icons.circle,
    this.text = "Button",
    this.onTap,
  });

  final IconData icon;
  final String text;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(text),
        titleAlignment: ListTileTitleAlignment.center,
        horizontalTitleGap: 20,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        onTap: () {
          Navigator.of(context).pop();
          onTap?.call();
        },
      ),
    );
  }
}
