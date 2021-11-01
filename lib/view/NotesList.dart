import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_getx/controller/NotesController.dart';
import 'package:todo_getx/model/NoteModel.dart';

class NotesList extends StatelessWidget {
  TextEditingController todoCon = TextEditingController();

  final NotesController controller = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: todo_appbar(),
      body: Container(
        width: 100.w,
        height: 100.h,
        child: Obx(() => controller.notes.length == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.hourglass_empty,
                      size: 30.h,
                    ),
                    Text(
                      'NOTHING FOUND IN TODO',
                      style: GoogleFonts.lato(fontSize: 18.sp),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  // var obj = controller.notes[index];
                  NoteModel obj = controller.notes[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                          child: Text(
                            (index+1).toString(),
                            
                            ),
                        ),
                        title: Text(obj.title.toString(),
                        style: GoogleFonts.lato(
                              fontSize: 20.sp,
                              
                            ),
                        ),
                      ),
                      Divider()
                    ],
                  );
                })),
      ),
    );
  }

  AppBar todo_appbar() {
    return AppBar(
      title: Text(
        'TODO GETx',
        style: GoogleFonts.lato(
            fontSize: 20.sp, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: 'Add Todo',
                  content: TextField(
                    controller: todoCon,
                  ),
                  onCancel: () {},
                  onConfirm: () {
                    if (todoCon.text == '') {
                      Get.snackbar('Error', 'Fill the todo field',
                          colorText: Colors.black,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red);
                    } else {
                      print(todoCon.text);
                      controller.add(NoteModel(title: todoCon.text));
                      Get.back();
                      Get.back();
                      todoCon.text = '';
                      Get.snackbar('Successfull', 'Todo Added Successfully',
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green);
                    }
                  });
            },
            icon: Icon(
              Icons.add,
              size: 5.h,
            ))
      ],
    );
  }
}
