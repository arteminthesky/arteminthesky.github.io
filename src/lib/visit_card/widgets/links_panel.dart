import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visit_card/visit_card/domain/profile.dart';
import 'package:visit_card/visit_card/widgets/icon_buttons.dart';

class LinksPanel extends StatelessWidget {
  const LinksPanel({Key? key, required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        if (profile.githubUrl != null)
          LinkIconButton.github(
            url: profile.githubUrl!,
          ),
        if (profile.linkedin != null)
          LinkIconButton.linkedin(
            url: profile.linkedin!,
          ),
        if (profile.telegram != null)
          LinkIconButton.telegram(
            url: profile.telegram!,
          ),
        if (profile.email != null)
          LinkIconButton.email(
            email: profile.email!,
          ),
      ],
    );
  }

  void _openGithub() {
    assert(profile.githubUrl != null);
    launch(profile.githubUrl!);
  }

  void _openLinkedin() {
    assert(profile.linkedin != null);
    launch(profile.linkedin!);
  }

  void _openTelegram() {
    assert(profile.telegram != null);
    launch(profile.telegram!);
  }
}
