class SuccessResponse {
  int? _status;
  bool? _logout;
  dynamic _data;

  int? get status => _status;
  bool? get logout => _logout;
  dynamic get data => _data;

  SuccessResponse({int? status, bool? logout, dynamic data}) {
    _status = status;
    _logout = logout;
    _data = data;
  }

  SuccessResponse.fromJson(dynamic json) {
    _status = json["status"];
    _logout = json["logout"];
    _data = json["data"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["logout"] = _logout;
    map["data"] = _data;
    return map;
  }
}