import 'package:flutter/foundation.dart';

class HomeScreenCategory extends ChangeNotifier{
  int _selectedIndex = 0;

  int _productScreenImgUrl = 0;

  int get productScreenImageUrl => _productScreenImgUrl;

  void updateProductScreenImageUrl(int newIndex){
    _productScreenImgUrl = newIndex;
    notifyListeners();
  }

  int _sizeIndex = 0;

  int get sizeIndex => _sizeIndex;

  void changeSizeIndex(int newIndex){
    _sizeIndex = newIndex;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  void changeIndex(int newIndex){
    _selectedIndex = newIndex;
    notifyListeners();
  }
}