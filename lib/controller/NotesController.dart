import 'package:get/get.dart';
import 'package:todo_getx/model/NoteModel.dart';
import 'package:get_storage/get_storage.dart';

class NotesController extends GetxController{
  RxList notes = [].obs;
  final storage = GetStorage();
  void add(NoteModel n){
    notes.add(n);
    storage.write('notes', notes);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    try{
      if(storage.read('notes') != null)
        notes = storage.read('notes');
      
    }catch(e){}

    update();

  }
}