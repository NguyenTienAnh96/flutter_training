class Trending {
  int _code;
  bool _success;
  bool _verify;
  String _message;
  List<DataTrending> _data;

  Trending(
      {int code,
      bool success,
      bool verify,
      String message,
      List<DataTrending> data}) {
    this._code = code;
    this._success = success;
    this._verify = verify;
    this._message = message;
    this._data = data;
  }

  int get code => _code;
  set code(int code) => _code = code;
  bool get success => _success;
  set success(bool success) => _success = success;
  bool get verify => _verify;
  set verify(bool verify) => _verify = verify;
  String get message => _message;
  set message(String message) => _message = message;
  List<DataTrending> get data => _data;
  set data(List<DataTrending> data) => _data = data;

  Trending.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _success = json['success'];
    _verify = json['verify'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = new List<DataTrending>();
      json['data'].forEach((v) {
        _data.add(new DataTrending.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['success'] = this._success;
    data['verify'] = this._verify;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataTrending {
  String _sId;
  String _catalog;
  String _code;
  String _name;
  List<Color> _color;
  List<Size> _size;
  String _detail;
  int _iV;
  String _id;

  Data(
      {String sId,
      String catalog,
      String code,
      String name,
      List<Color> color,
      List<Size> size,
      String detail,
      int iV,
      String id}) {
    this._sId = sId;
    this._catalog = catalog;
    this._code = code;
    this._name = name;
    this._color = color;
    this._size = size;
    this._detail = detail;
    this._iV = iV;
    this._id = id;
  }

  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  String get catalog => _catalog;
  set catalog(String catalog) => _catalog = catalog;
  String get code => _code;
  set code(String code) => _code = code;
  String get name => _name;
  set name(String name) => _name = name;
  List<Color> get color => _color;
  set color(List<Color> color) => _color = color;
  List<Size> get size => _size;
  set size(List<Size> size) => _size = size;
  String get detail => _detail;
  set detail(String detail) => _detail = detail;
  int get iV => _iV;
  set iV(int iV) => _iV = iV;
  String get id => _id;
  set id(String id) => _id = id;

  DataTrending.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _catalog = json['catalog'];
    _code = json['code'];
    _name = json['name'];
    if (json['color'] != null) {
      _color = new List<Color>();
      json['color'].forEach((v) {
        _color.add(new Color.fromJson(v));
      });
    }
    if (json['size'] != null) {
      _size = new List<Size>();
      json['size'].forEach((v) {
        _size.add(new Size.fromJson(v));
      });
    }
    _detail = json['detail'];
    _iV = json['__v'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['catalog'] = this._catalog;
    data['code'] = this._code;
    data['name'] = this._name;
    if (this._color != null) {
      data['color'] = this._color.map((v) => v.toJson()).toList();
    }
    if (this._size != null) {
      data['size'] = this._size.map((v) => v.toJson()).toList();
    }
    data['detail'] = this._detail;
    data['__v'] = this._iV;
    data['id'] = this._id;
    return data;
  }
}

class Color {
  List<String> _image;
  String _sId;
  String _code;

  Color({List<String> image, String sId, String code}) {
    this._image = image;
    this._sId = sId;
    this._code = code;
  }

  List<String> get image => _image;
  set image(List<String> image) => _image = image;
  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  String get code => _code;
  set code(String code) => _code = code;

  Color.fromJson(Map<String, dynamic> json) {
    _image = json['image'].cast<String>();
    _sId = json['_id'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this._image;
    data['_id'] = this._sId;
    data['code'] = this._code;
    return data;
  }
}

class Size {
  String _sId;
  String _code;
  String _name;
  String _price;

  Size({String sId, String code, String name, String price}) {
    this._sId = sId;
    this._code = code;
    this._name = name;
    this._price = price;
  }

  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  String get code => _code;
  set code(String code) => _code = code;
  String get name => _name;
  set name(String name) => _name = name;
  String get price => _price;
  set price(String price) => _price = price;

  Size.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _code = json['code'];
    _name = json['name'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['code'] = this._code;
    data['name'] = this._name;
    data['price'] = this._price;
    return data;
  }
}
