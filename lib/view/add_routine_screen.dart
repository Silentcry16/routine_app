import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine_app/controller/isar_controller.dart';

class AddNewScreen extends StatelessWidget {
  AddNewScreen({Key? key}) : super(key: key);

  final TextEditingController _title = TextEditingController();

  final IsarController isarController = Get.put(IsarController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<IsarController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
      ),
      body: GetBuilder<IsarController>(
        builder: (IsarController catsController) => Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.7,
                    height: Get.height * 0.07,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: catsController.selectedCat,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: controller.catsList.map<DropdownMenuItem<String>>(
                        (e) {
                          return DropdownMenuItem<String>(
                            value: e.name,
                            child: Text(e.name),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        controller.selectedCat = value!;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: Get.width * 0.1,
                    height: Get.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(Get.width * 0.1),
                    ),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Add a new category'),
                            content: TextField(
                              controller: _title,
                              decoration: const InputDecoration(
                                hintText: 'Category',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  controller.addnewCategory();
                                  _title.clear();
                                  Get.back();
                                },
                                child: const Text('Add'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
