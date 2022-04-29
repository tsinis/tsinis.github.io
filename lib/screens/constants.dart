import 'package:flutter/widgets.dart';

import '../themes/colors.dart';
import 'sections/about.dart';
import 'sections/contacts.dart';
import 'sections/footer.dart';
import 'sections/portfolio.dart';

const sections = [
  ColoredBox(color: MyColors.primaryColor, child: About()),
  Portfolio(),
  Contact(),
  Footer(),
];
