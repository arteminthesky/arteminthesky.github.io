import 'package:flutter/material.dart';
import 'package:visit_card/visit_card/cv/sections/sections.dart';
import 'package:visit_card/visit_card/domain/profile.dart';

class CvWidget extends StatelessWidget {
  const CvWidget({Key? key, required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseInfoSection(profile: profile),
          if (profile.hasContactInformation)
            ContactInformationSection(
              profile: profile,
            ),
          if (profile.workExperience != null)
            WorkExperienceSection(
              workExperience: profile.workExperience!,
            ),
          if (profile.skills != null)
            SkillsSection(
              skills: profile.skills!,
            ),
        ],
      ),
    );
  }
}
