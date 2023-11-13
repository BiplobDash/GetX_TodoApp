import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_note_app/controller/note_controller.dart';
import 'package:smart_note_app/utils/colors.dart';
import 'package:smart_note_app/views/Add%20Task%20Screen/add_note_screen.dart';

class TodoListString extends StatelessWidget {
  const TodoListString({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      NoteController(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: AppColors.whiteColor),
        ),
        title: Text(
          'Smart Note App',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: AppColors.whiteColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColors.whiteColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.noteList.length,
          itemBuilder: (_, index) {
            final data = controller.noteList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: ListTile(
                onLongPress: () {
                  controller.triggerDelete(index);
                },
                onTap: () {
                  Get.to(
                    () => AddNoteScreen(
                      type: 'update',
                      data: data,
                      index: index,
                    ),
                  );
                  Get.back();
                },
                leading: Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                    color: data.priority == 1
                        ? AppColors.primaryColor
                        : AppColors.redColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      data.noteDate.toString().split(' ')[0],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  data.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: data.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(
                  data.description,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                  ),
                ),
                trailing: Checkbox(
                  activeColor: AppColors.primaryColor,
                  shape: const CircleBorder(),
                  value: data.isDone,
                  onChanged: (value) {
                    controller.triggerCheckBox(index);
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Get.to(
            () => const AddNoteScreen(),
          );
        },
        child: Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
