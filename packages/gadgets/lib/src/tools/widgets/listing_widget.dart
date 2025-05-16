import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../enums/list_enum.dart';

class ListingWidget extends StatelessWidget {
  final ListType listType;
  final VariantListType variantType;
  final List<dynamic> itemList;
  final int length;
  final Axis scrollDirection;
  final ScrollController? scrollController;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration decoration;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double? mainAxisExtent;
  final ScrollPhysics? physics;

  final bool shrinkWrap;

  final Widget Function(BuildContext context, int index) itemsBuilder;

  const ListingWidget({
    super.key,
    required this.listType,
    this.variantType = VariantListType.none,
    this.itemList = const [],
    this.length = 0,
    this.scrollDirection = Axis.vertical,
    this.scrollController,
    required this.itemsBuilder,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.decoration = const BoxDecoration(),
    this.crossAxisCount = 1,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.mainAxisExtent = 0.0,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    switch (listType) {
      case ListType.grid:

        //*-- GridViews --*//
        switch (variantType) {
          case VariantListType.builder:
            return Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              decoration: decoration,
              child: GridView.builder(
                physics: physics,
                shrinkWrap: shrinkWrap,
                scrollDirection: scrollDirection,
                controller: scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: mainAxisSpacing,
                  crossAxisSpacing: crossAxisSpacing,
                  mainAxisExtent: mainAxisExtent,
                ),
                itemCount: itemList.isEmpty ? length : itemList.length,
                itemBuilder: itemsBuilder,
              ),
            );

          default:
            return Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              child: GridView.count(
                physics: physics,
                shrinkWrap: shrinkWrap,
                scrollDirection: scrollDirection,
                controller: scrollController,
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                children: <Widget> [
                ],
              ),
            );
        }

      case ListType.masonryGrid:

        //*-- MasonryGridViews --*//
        switch (variantType) {
          case VariantListType.builder:
            return Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              child: MasonryGridView.builder(
                physics: physics,
                shrinkWrap: shrinkWrap,
                itemCount: itemList.isEmpty ? length : itemList.length,

                scrollDirection: scrollDirection,
                controller: scrollController,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                ),
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                itemBuilder: itemsBuilder,
              ),
            );

          default:
            return Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              child: MasonryGridView.count(
                physics: physics,
                shrinkWrap: shrinkWrap,
                scrollDirection: scrollDirection,
                controller: scrollController,
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                itemBuilder: itemsBuilder,
              ),
            );
        }
      case ListType.list:

        //*-- ListViews --*//
        switch (variantType) {
          case VariantListType.builder:
            return Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              child: ListView.builder(
                physics: physics,
                shrinkWrap: shrinkWrap,
                scrollDirection: scrollDirection,
                controller: scrollController,
                itemCount: itemList.isEmpty ? length : itemList.length,
                itemBuilder: itemsBuilder,
              ),
            );

          default:
            return ListView();
        }
    }
  }
}
