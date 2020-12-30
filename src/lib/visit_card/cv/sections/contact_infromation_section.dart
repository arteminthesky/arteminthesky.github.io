part of sections;

class ContactInformationSection extends StatelessWidget {
  ContactInformationSection({Key? key, required this.profile})
      : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return _Section(
      header: const SectionHeader('Contact Information'),
      body: LinksPanel(profile: profile),
    );
  }
}
