import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onClick;

  const DashboardButton(this.title, this.icon,
      {Key? key, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 100,
          width: 150,
          color: Colors.green,
          child: Material(
            color: Colors.green,
            child: InkWell(
              onTap: () => onClick(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
