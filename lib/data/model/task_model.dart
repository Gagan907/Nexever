// class Task {
//   var data;

//   Task({required this.data});

//   Task.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data =  <Data>[];
//       json['data'].forEach((v) {
//         data.add(Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['data'] = this.data.map((v) => v.toJson()).toList();
//     return data;
//   }
// }

// class Data {
//   var title;
//   List<Category>? category;

//   Data({this.title, required this.category});

//   Data.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     if (json['category'] != null) {
//       category =  json['category'].forEach((v) {
//         category?.add(Category.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['title'] = title;
//     data['category'] = category?.map((v) => v.toJson()).toList();
//     return data;
//   }
// }

// class Category {
//   var name;
//   var image;

//   Category({this.name, this.image});

//   Category.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['image'] = image;
//     return data;
//   }
// }

class Task {
  List<Data>? data;

  Task({this.data});

  Task.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? title;
  List<Category>? category;

  Data({this.title, this.category});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? name;
  String? image;

  Category({this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
