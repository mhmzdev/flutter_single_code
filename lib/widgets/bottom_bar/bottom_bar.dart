import 'package:flutter/material.dart';
import 'package:flutter_single_code/router/routes.dart';

part '_data.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        MediaQuery.of(context).padding.bottom + 8,
      ),
      child: Row(
        children: list.map((item) {
          final selected = item.route == currentRoute;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (selected) return;
                Navigator.pushReplacementNamed(context, item.route);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    color: selected ? Colors.deepPurple : Colors.grey,
                  ),
                  Text(
                    item.title,
                    style: TextStyle(
                      color: selected ? Colors.deepPurple : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
