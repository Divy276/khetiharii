import 'package:flutter/material.dart';

class Mycategory extends StatefulWidget {
  const Mycategory({super.key});

  @override
  State<Mycategory> createState() => _MycategoryState();
}

class _MycategoryState extends State<Mycategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cat.jpeg'), fit: BoxFit.cover)
        )
    );
  }
}