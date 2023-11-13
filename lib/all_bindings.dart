import 'package:get/get.dart';
import 'package:smart_note_app/controller/note_controller.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteController(),);
  }
}
