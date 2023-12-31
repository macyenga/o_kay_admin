import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_kay_admin/constants/colors.dart';

class MyAppBar extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String? title;
  final String? subtitle;
  final Builder? leadingIcon;

  const MyAppBar({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.title,
    this.subtitle,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: foregroundColor ?? Colors.white,
      backgroundColor: backgroundColor ?? Color.fromARGB(255, 16, 2, 214),
      expandedHeight: 110,
      collapsedHeight: 60,
      forceElevated: true,
      elevation: 0,
      shadowColor: Colors.transparent,
      floating: true,
      pinned: true,
      leading: leadingIcon ??
          BackButton(
            color: foregroundColor == null
                ? Colors.white
                : Color.fromARGB(255, 16, 2, 214),
          ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border_rounded,
            color: foregroundColor == null
                ? Colors.white
                : Color.fromARGB(255, 16, 2, 214),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: foregroundColor == null
                ? Colors.white
                : Color.fromARGB(255, 16, 2, 214),
          ),
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? 'Home',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtitle ?? '320 St. 320',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            const SizedBox(height: 80.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CupertinoTextField(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                placeholder: 'Search for shop & restaurants',
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.search,
                    color: MyColors.secondaryIconColor,
                  ),
                ),
                decoration: BoxDecoration(
                  color: MyColors.backgroundColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                style: const TextStyle(
                  color: MyColors.secondaryTextColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
