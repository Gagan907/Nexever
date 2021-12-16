class CommonResponse<T> {

  int? status;
  bool? logout;
  dynamic data;
  T? model;
  String? error;

  CommonResponse({this.status, this.logout, this.data, this.error});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    logout = json['logout'];
    data = json['data'] ;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['logout'] = logout;
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data.toQueryIdJson();
    }
    return data;
  }
} 