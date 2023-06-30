import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine_app/view/add_routine_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: Text('Isar & GetX'),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Text('text'),
        ),
        // color: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNewScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
