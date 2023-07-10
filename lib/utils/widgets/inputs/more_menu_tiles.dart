import 'package:flutter/material.dart';

class MoreMenuTile extends StatefulWidget {
  const MoreMenuTile({Key? key, required this.icon, required this.title})
      : super(key: key);
  final IconData icon;
  final String title;

  @override
  State<StatefulWidget> createState() => _MoreMenuTileState();
}

class _MoreMenuTileState extends State<MoreMenuTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              size: 26,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              widget.title,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ));
  }
}
