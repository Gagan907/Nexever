class SuccessResponse {
  int? _status;
  String? _msg;
  dynamic _data;

  int? get status => _status;
  String? get msg => _msg;
  dynamic get data => _data;

  SuccessResponse({int? status, bool? logout, String? msg, dynamic data}) {
    _status = status;
    _msg = msg;
    _data = data;
  }

  SuccessResponse.fromJson(dynamic json) {
    _status = json["status"];
    _msg = json["msg"];
    _data = json["data"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["msg"] = _msg;
    map["data"] = _data;
    return map;
  }
}
