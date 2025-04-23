
import 'package:flutter/cupertino.dart';

class CenteredIllustration extends StatelessWidget {
  const CenteredIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/Rock-Stacking-VisitAruba.jpg',
        width: MediaQuery.of(context).size.width * 0.7,
      ),
    );
  }
}
