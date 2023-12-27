import 'package:mobx/mobx.dart';
part 'information_capture_store.g.dart';

// ignore: library_private_types_in_public_api
class InformationCaptureStore = _InformationCaptureBase
    with _$InformationCapture;

abstract class _InformationCaptureBase with Store {
  @observable
  ObservableList<String> infoList = ObservableList<String>();

  @action
  void addInfo(String value) {
    infoList.add(value);
  }

  @action
  void removeInfo(int index) {
    infoList.removeAt(index);
  }
}
