import 'package:demo_apis_flutter/models/user_model.dart';
import 'package:demo_apis_flutter/repositories/user_methods.dart';
import 'package:demo_apis_flutter/screens/home_screen/user_card.dart';
import 'package:demo_apis_flutter/screens/user_detail_screen/user_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<UserModel> usersList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: UserMethods.instance().getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Error occurred!");
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data is List){
              for(Map<String, dynamic> map in snapshot.data){
                UserModel user = UserModel.fromJson(map: map);
                usersList.add(user);
              }
            }
            if(snapshot.data is Map<String, dynamic>){
              UserModel user = UserModel.fromJson(map: snapshot.data);
              usersList.add(user);
            }
            return ListView.builder(
              itemCount: usersList.length,
              itemBuilder: (context, index) {
                UserModel user = usersList[index];
                return UserCard(
                  user: user,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(userId: user.id,),
                      )),
                );
              },
            );
          },
        ));
  }
}
