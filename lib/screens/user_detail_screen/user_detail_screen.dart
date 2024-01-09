import 'package:demo_apis_flutter/repositories/user_methods.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatefulWidget {
  final int userId;
  const UserDetailScreen({super.key, required this.userId});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Data"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: UserMethods.instance().getUsers(userId: widget.userId.toString()),
          builder:  (context, snapshot) {
            return SizedBox();
          },
      ),
    );
  }
}
