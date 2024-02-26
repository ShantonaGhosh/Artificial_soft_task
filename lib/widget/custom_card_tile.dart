import 'package:flutter/material.dart';

class CustomCardTile extends StatelessWidget {
  const CustomCardTile({
    super.key,
    this.title,
    this.subTitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.bgColor,
    this.visualDensity,
  });
  final Widget? title;
  final Widget? subTitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? bgColor;
  final VisualDensity? visualDensity;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor ?? Colors.grey.shade200,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        onTap: onTap,
        title: title,
        subtitle: subTitle,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 30.0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        leading: leading,
        trailing: trailing,
        visualDensity:
            visualDensity ?? const VisualDensity(horizontal: 0, vertical: -1.5),
      ),
    );
  }
}
