import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../enums/buttons_enum.dart';

class ButtonsWidget extends StatelessWidget {
  final ButtonsType buttonsType;
  final VariantButtonType variantType;
  final Widget labelButton;
  final Widget? iconButton;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final bool isLoading;
  final Widget loadigIndicator;
  final String toolTip;
  final Widget? openIcon;
  final Widget? closeIcon;
  final List<SpeedDialChild> allFloatingButton;

  const ButtonsWidget({
    super.key,
    required this.buttonsType,
    this.variantType = VariantButtonType.none,
    this.onPressed,
    this.style,
    this.labelButton = const Text("Label"),
    this.iconButton,
    this.isLoading = false,
    this.loadigIndicator = const CircularProgressIndicator(
      color: Color.fromRGBO(0, 0, 0, 1),
      strokeWidth: 2.0,
    ),
    this.toolTip = '',
    this.openIcon,
    this.closeIcon,
    this.allFloatingButton = const <SpeedDialChild>[],
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonsType) {
      //*-- Buttons Filled --*//
      case ButtonsType.filled:
        switch (variantType) {
          case VariantButtonType.icon:
            return FilledButton.icon(
              label: isLoading ? loadigIndicator : labelButton,
              icon: iconButton,
              style: style,
              onPressed: isLoading ? null : onPressed,
            );
          default:
            return FilledButton(
              style: style,
              onPressed: isLoading ? null : onPressed,
              child: isLoading ? loadigIndicator : labelButton,
            );
        }

      //*-- Buttons Elevated --*//
      case ButtonsType.elevated:
        switch (variantType) {
          case VariantButtonType.icon:
            return ElevatedButton.icon(
              label: isLoading ? loadigIndicator : labelButton,
              icon: iconButton,
              style: style,
              onPressed: isLoading ? null : onPressed,
            );
          default:
            return ElevatedButton(
              style: style,
              onPressed: isLoading ? null : onPressed,
              child: isLoading ? loadigIndicator : labelButton,
            );
        }

      //*-- Buttons Outlined --*//
      case ButtonsType.outlined:
        switch (variantType) {
          case VariantButtonType.icon:
            return OutlinedButton.icon(
              label: isLoading ? loadigIndicator : labelButton,
              icon: iconButton,
              style: style,
              onPressed: isLoading ? null : onPressed,
            );
          default:
            return OutlinedButton(
              style: style,
              onPressed: isLoading ? null : onPressed,
              child: isLoading ? loadigIndicator : labelButton,
            );
        }

      //*-- Buttons Text --*//
      case ButtonsType.text:
        switch (variantType) {
          case VariantButtonType.icon:
            return TextButton.icon(
              label: isLoading ? loadigIndicator : labelButton,
              icon: iconButton,
              style: style,
              onPressed: isLoading ? null : onPressed,
            );
          default:
            return TextButton(
              style: style,
              onPressed: isLoading ? null : onPressed,
              child: isLoading ? loadigIndicator : labelButton,
            );
        }
      //*-- Buttons Icon --*//
      case ButtonsType.icon:
        switch (variantType) {
          case VariantButtonType.fill:
            return IconButton.filled(
              icon: isLoading ? loadigIndicator : iconButton!,
              style: style,
              onPressed: isLoading ? null : onPressed,
            );
          default:
            return IconButton(
              icon: isLoading ? loadigIndicator : iconButton!,
              style: style,
              onPressed: isLoading ? null : onPressed,
            );
        }

      //*-- Buttons Floating --*//
      case ButtonsType.floatingButton:
        switch (variantType) {
          case VariantButtonType.multiButton:
            return SpeedDial(
              heroTag: null,
              activeChild: closeIcon,
              animatedIconTheme: const IconThemeData(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              backgroundColor: const Color.fromRGBO(255, 182, 7, 1),
              renderOverlay: false,
              curve: Curves.bounceInOut,
              animationDuration: const Duration(milliseconds: 250),
              children: allFloatingButton,
              child: openIcon,
            );
          default:
            return FloatingActionButton(
              onPressed: isLoading ? null : onPressed,
              child: isLoading ? loadigIndicator : labelButton,
            );
        }
    }
  }
}
