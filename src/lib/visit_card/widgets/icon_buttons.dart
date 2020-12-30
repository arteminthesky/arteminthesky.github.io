import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visit_card/visit_card/resources/app_icons.dart';

enum LinkType {
  email,
}

class LinkIconButton extends StatelessWidget {
  const LinkIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.size = 30,
  }) : super(key: key);

  LinkIconButton.github({
    Key? key,
    required String url,
    double? size,
  }) : this(
          key: key,
          icon: Icon(AppIcons.github_circled),
          size: size,
          onTap: getLaunchFunction(url),
        );

  LinkIconButton.linkedin({
    Key? key,
    required String url,
    double? size,
  }) : this(
          key: key,
          icon: Icon(AppIcons.linkedin_circled),
          size: size,
          onTap: getLaunchFunction(url),
        );

  LinkIconButton.email({
    Key? key,
    required String email,
    double? size,
  }) : this(
          key: key,
          icon: Icon(AppIcons.mail),
          size: size,
          onTap: getLaunchFunction("mailto:$email"),
        );

  LinkIconButton.telegram({
    Key? key,
    required String url,
    double? size,
  }) : this(
          key: key,
          icon: Icon(AppIcons.telegram),
          size: size,
          onTap: getLaunchFunction(url),
        );

  final Icon icon;
  final VoidCallback onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onTap,
      iconSize: size ?? 30,
      splashRadius: 20,
    );
  }
}

VoidCallback getLaunchFunction(String source) {
  return () => launch(source);
}
