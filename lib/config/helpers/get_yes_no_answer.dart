import 'package:app_maybe/domain/entities/message.dart';
import 'package:app_maybe/infrastructure/model/Yes_No_Model.dart';
import 'package:dio/dio.dart';

class GetyesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final resDecode = YesOrNot.fromJsonMap(response.data);

    return resDecode.toMessageEntity();
  }
}
