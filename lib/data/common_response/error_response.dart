class ErrorResponse {
  int? _status;
  String? _msg;

  int? get status => _status;
  String? get msg => _msg;

  ErrorResponse({int? status, bool? logout, String? msg}) {
    _status = status;
    _msg = msg;
  }

  ErrorResponse.fromJson(dynamic json) {
    _status = json["status"];
    _msg = json["error"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["error"] = _msg;
    return map;
  }
}
