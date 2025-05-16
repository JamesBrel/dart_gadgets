import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final List<dynamic> itemList;
  final double height;
  final Widget? Function(BuildContext context, int index) tabButtonBuilder;

  const TabBarWidget({
    super.key,
    required this.itemList,
    this.height = 32.0,
    required this.tabButtonBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.only(top: 10.0),
      child:
          itemList.length > 2
              ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemList.length,
                itemBuilder: tabButtonBuilder,
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  itemList.length,
                  (int index) => tabButtonBuilder(context, index)!,
                ),
              ),
    );
  }
}
