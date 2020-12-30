import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:visit_card/app_routes.dart';
import 'package:visit_card/visit_card/domain/profile.dart';
import 'package:visit_card/visit_card/resources/app_colors.dart';
import 'package:visit_card/visit_card/widgets/links_panel.dart';

class VisitCardScreen extends StatefulWidget {
  VisitCardScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<VisitCardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Profile _profile;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _profile = Provider.of<Profile>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Card(
          color: AppColors.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: NetworkImage(_profile.avatar!),
                      width: 90,
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      _profile.name,
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        if (_controller.status == AnimationStatus.forward ||
                            _controller.status == AnimationStatus.completed) {
                          _controller.reverse();
                        } else {
                          _controller.forward();
                        }
                      },
                      child: Text('More'),
                    ),
                    const SizedBox(
                      width: 90,
                      child: Divider(thickness: 1,),
                    ),
                    LinksPanel(
                      profile: _profile,
                    ),
                  ],
                ),
                IntrinsicHeight(
                  child: SizeTransition(
                    sizeFactor: _controller,
                    axis: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        VerticalDivider(thickness: 1,),
                        Column(
                          children: [
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(articles);
                              },
                              child: Text('Articles'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(cv);
                              },
                              child: Text('CV'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(projects);
                              },
                              child: Text('Projects'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
