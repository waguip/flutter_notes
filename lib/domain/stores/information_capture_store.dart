import 'package:mobx/mobx.dart';
import 'package:prova_target_sistemas/domain/services/shared_preferences_service.dart';
part 'information_capture_store.g.dart';

// ignore: library_private_types_in_public_api
class InformationCaptureStore = _InformationCaptureBase
    with _$InformationCapture;

abstract class _InformationCaptureBase with Store {
  @observable
  ObservableList<String> infoList = ObservableList<String>();

  @action
  Future<String> getInfoList() async {
    infoList = ObservableList.of(
      await SharedPreferenceService.getList('infoList'),
    );
    return '';
  }

  @action
  void addInfo(String value) {
    infoList.add(value);
    SharedPreferenceService.setList('infoList', infoList);
  }

  @action
  void removeInfo(int index) {
    infoList.removeAt(index);
    SharedPreferenceService.setList('infoList', infoList);
  }
}
