import 'package:flutter/cupertino.dart';

class Services {
  String title;
  String name;
  String price;
  int id;

  Services({
    required this.name,
    required this.price,
    required this.title,
    required this.id,
  });
}



class ServicesNotifier extends ChangeNotifier {
  final List<Services> _notes = [];

  List<Services> get services => _notes;

  void addNote(Services service) {
    _notes.add(service);
    notifyListeners();
  }

   void removeNote(Services note) {
    _notes.removeWhere((item) => item.id == note.id);
    notifyListeners();
  }

  void editService(Services note) {
    int index = _notes.indexWhere((element) => element.id == note.id);
    _notes[index] = note;
    notifyListeners();
  }
}