// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HostData {
  String name, location;
  HostData({
    required this.name,
    required this.location,
  });
}

class BookHost extends StatefulWidget {
  HostData host;

  BookHost({super.key, required this.host});

  @override
  State<BookHost> createState() => _BookHostState();
}

class _BookHostState extends State<BookHost> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
