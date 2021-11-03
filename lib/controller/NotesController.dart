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
  void delete(int index){
    notes.removeAt(index);
    storage.write('notes', notes);
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    

    try{
      if(storage.read('notes') != null)
        notes = storage.read('notes');
    }catch(e){}

    update();
    super.onInit();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    storage.write('notes', notes);
    super.onClose();
  }
}