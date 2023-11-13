import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_note_app/controller/note_controller.dart';
import 'package:smart_note_app/model/note_model.dart';
import 'package:smart_note_app/utils/colors.dart';

class AddNoteScreen extends StatefulWidget {
  final String? type;
  final NoteModel? data;
  final int? index;
  const AddNoteScreen({
    super.key,
    this.type,
    this.data,
    this.index,
  });

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  int selectedValue = 0;
  DateTime selectedTime = DateTime.now();
  void selectedDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedTime,
      firstDate: DateTime(2005),
      lastDate: DateTime(2050),
    );
    if (picked != selectedTime) {
      setState(() {
        selectedTime = picked!;
      });
    }
  }

  void updateData() {
    selectedValue = widget.data!.priority;
    selectedTime = widget.data!.noteDate;
    _titleController.text = widget.data!.title;
    _descriptionController.text = widget.data!.description;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.type == 'update' ? updateData() : null;
  }

  final controller = Get.put(
    NoteController(),
  );

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          widget.type == 'update' ? 'Update' : 'Add Task',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add Title',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextFormField(
                minLines: 1,
                maxLines: 8,
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write Description',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  selectedDate();
                },
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calendar_month_outlined),
                    border: const OutlineInputBorder(),
                    hintText: selectedTime == DateTime.now()
                        ? 'Selecte Time'
                        : selectedTime.toLocal().toString().split(' ')[0],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Set Task Priorety',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Normal'),
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (val) {
                        setState(
                          () {
                            selectedValue = val!;
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Urgent'),
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (val) {
                        setState(
                          () {
                            selectedValue = val!;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  widget.type == 'update'
                      ? controller.updateData(
                          _titleController.text,
                          _descriptionController.text,
                          selectedTime,
                          selectedValue,
                          controller.noteList[widget.index!].isDone,
                          widget.index!,
                        )
                      : controller.noteAdd(
                          _titleController.text,
                          _descriptionController.text,
                          selectedTime,
                          selectedValue,
                        );
                  Get.back();
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(
                        widget.type == 'update' ? 'UPDATE TASK' : 'ADD Task',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
