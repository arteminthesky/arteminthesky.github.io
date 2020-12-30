import 'package:flutter/cupertino.dart';
import 'package:visit_card/articles_screen/articles_screen.dart';
import 'package:visit_card/projects_screen/projects_screen.dart';
import 'package:visit_card/visit_card/cv/cv_screen.dart';
import 'package:visit_card/visit_card/home_screen/visit_card_screen.dart';

const String home = "/";
const String cv = "/cv";
const String projects = "/projects";
const String articles = "/articles";

final routes = {
  home: (BuildContext context) => VisitCardScreen(),
  cv: (BuildContext context) => CvScreen(),
  projects: (BuildContext context) => const ProjectsScreen(),
  articles: (BuildContext context) => const ArticlesScreen(),
};
