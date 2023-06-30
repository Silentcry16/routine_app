import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine_app/controller/category_controller.dart';

class AddNewScreen extends StatelessWidget {
  const AddNewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryContoller categoryContoller = Get.put(CategoryContoller());
    final controller = Get.find<CategoryContoller>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
      ),
      body: Obx(
        () => Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      value: controller.selectedCat.value,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: controller.cats.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedCat.value = value!;
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
                        borderRadius: BorderRadius.circular(Get.width * 0.1)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
