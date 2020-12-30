import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:visit_card/app_routes.dart';

import 'package:visit_card/visit_card/domain/profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  rootBundle.loadString('assets/profile.json').then((value) {
    Map<String, Object> json = jsonDecode(value) as Map<String, Object>;

    Profile profile = Profile.fromJson(json);
    runApp(MyApp(
      profile: profile,
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Provider<Profile>(
      create: (_) => profile,
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
      ),
    );
  }
}
