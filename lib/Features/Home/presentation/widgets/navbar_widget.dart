import 'package:flutter/material.dart';

class ElementNav extends StatelessWidget {
  const ElementNav(
      {super.key,
      required this.name,
      required this.image,
      required this.route});

  final String name;
  final String image;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, route)},
      child: SizedBox(
        height: 77,
        width: 73,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 24,
                width: 73,
                color: Colors.grey,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Text(name),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage(image)),
            )
          ],
        ),
      ),
    );
  }
}
