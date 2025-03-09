import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NCBody extends StatefulWidget {
  const NCBody({super.key, required this.child});

  final Widget child;

  @override
  State<NCBody> createState() => _NCBodyState();
}

class _NCBodyState extends State<NCBody> {
  @override
  Widget build(BuildContext context) {
    return Center(child: widget.child);
  }
}
