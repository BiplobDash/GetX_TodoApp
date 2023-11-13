import 'package:get/get.dart';
import 'package:smart_note_app/model/note_model.dart';
import 'package:smart_note_app/utils/colors.dart';

class NoteController extends GetxController {
  final noteList = <NoteModel>[].obs;

  noteAdd(
    String title,
    description,
    DateTime noteDate,
    int priority,
  ) {
    noteList.add(NoteModel(
      title: title,
      description: description,
      isDone: false,
      noteDate: noteDate,
      priority: priority,
    ));
  }

  triggerCheckBox(int index) {
    noteList[index].isDone = !noteList[index].isDone;
    noteList.refresh();
  }

  triggerDelete(int index) {
    noteList.removeAt(index);
    Get.snackbar(
      'Deleted',
      'No ${index + 1} data has been removed!',
      backgroundColor: AppColors.redColor,
      snackPosition: SnackPosition.BOTTOM
    );
  }

  updateData(
    String title,
    description,
    DateTime noteDate,
    int priority,
    bool isDone,
    int index,
  ) {
    noteList[index].title = title;
    noteList[index].description = description;
    noteList[index].noteDate = noteDate;
    noteList[index].priority = priority;
    noteList[index].isDone = isDone;
    noteList.refresh();
    Get.snackbar(
      'Update',
      'Data has been successfully updated!',
      backgroundColor: AppColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
    );
    
  }
}
