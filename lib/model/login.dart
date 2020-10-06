class Login {
  int _code;
  bool _success;
  bool _verify;
  String _message;
  Data _data;

  Login({int code, bool success, bool verify, String message, Data data}) {
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
  Data get data => _data;
  set data(Data data) => _data = data;

  Login.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _success = json['success'];
    _verify = json['verify'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['success'] = this._success;
    data['verify'] = this._verify;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Data {
  String _token;
  User _user;

  Data({String token, User user}) {
    this._token = token;
    this._user = user;
  }

  String get token => _token;
  set token(String token) => _token = token;
  User get user => _user;
  set user(User user) => _user = user;

  Data.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this._token;
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    return data;
  }
}

class User {
  int _dob;
  bool _gender;
  int _status;
  int _createDate;
  int _updateDate;
  List<String> _tokenDevices;
  String _sId;
  String _userName;
  String _tokenId;
  String _displayName;
  String _photoUrl;
  String _photoId;
  String _address;
  String _email;
  String _phoneNumber;
  String _roleId;
  String _hash;
  int _iV;
  String _id;

  User(
      {int dob,
      bool gender,
      int status,
      int createDate,
      int updateDate,
      List<String> tokenDevices,
      String sId,
      String userName,
      String tokenId,
      String displayName,
      String photoUrl,
      String photoId,
      String address,
      String email,
      String phoneNumber,
      String roleId,
      String hash,
      int iV,
      String id}) {
    this._dob = dob;
    this._gender = gender;
    this._status = status;
    this._createDate = createDate;
    this._updateDate = updateDate;
    this._tokenDevices = tokenDevices;
    this._sId = sId;
    this._userName = userName;
    this._tokenId = tokenId;
    this._displayName = displayName;
    this._photoUrl = photoUrl;
    this._photoId = photoId;
    this._address = address;
    this._email = email;
    this._phoneNumber = phoneNumber;
    this._roleId = roleId;
    this._hash = hash;
    this._iV = iV;
    this._id = id;
  }

  int get dob => _dob;
  set dob(int dob) => _dob = dob;
  bool get gender => _gender;
  set gender(bool gender) => _gender = gender;
  int get status => _status;
  set status(int status) => _status = status;
  int get createDate => _createDate;
  set createDate(int createDate) => _createDate = createDate;
  int get updateDate => _updateDate;
  set updateDate(int updateDate) => _updateDate = updateDate;
  List<String> get tokenDevices => _tokenDevices;
  set tokenDevices(List<String> tokenDevices) => _tokenDevices = tokenDevices;
  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  String get tokenId => _tokenId;
  set tokenId(String tokenId) => _tokenId = tokenId;
  String get displayName => _displayName;
  set displayName(String displayName) => _displayName = displayName;
  String get photoUrl => _photoUrl;
  set photoUrl(String photoUrl) => _photoUrl = photoUrl;
  String get photoId => _photoId;
  set photoId(String photoId) => _photoId = photoId;
  String get address => _address;
  set address(String address) => _address = address;
  String get email => _email;
  set email(String email) => _email = email;
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;
  String get roleId => _roleId;
  set roleId(String roleId) => _roleId = roleId;
  String get hash => _hash;
  set hash(String hash) => _hash = hash;
  int get iV => _iV;
  set iV(int iV) => _iV = iV;
  String get id => _id;
  set id(String id) => _id = id;

  User.fromJson(Map<String, dynamic> json) {
    _dob = json['dob'];
    _gender = json['gender'];
    _status = json['status'];
    _createDate = json['createDate'];
    _updateDate = json['updateDate'];
    _tokenDevices = json['tokenDevices'].cast<String>();
    _sId = json['_id'];
    _userName = json['userName'];
    _tokenId = json['tokenId'];
    _displayName = json['displayName'];
    _photoUrl = json['photoUrl'];
    _photoId = json['photoId'];
    _address = json['address'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _roleId = json['roleId'];
    _hash = json['hash'];
    _iV = json['__v'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this._dob;
    data['gender'] = this._gender;
    data['status'] = this._status;
    data['createDate'] = this._createDate;
    data['updateDate'] = this._updateDate;
    data['tokenDevices'] = this._tokenDevices;
    data['_id'] = this._sId;
    data['userName'] = this._userName;
    data['tokenId'] = this._tokenId;
    data['displayName'] = this._displayName;
    data['photoUrl'] = this._photoUrl;
    data['photoId'] = this._photoId;
    data['address'] = this._address;
    data['email'] = this._email;
    data['phoneNumber'] = this._phoneNumber;
    data['roleId'] = this._roleId;
    data['hash'] = this._hash;
    data['__v'] = this._iV;
    data['id'] = this._id;
    return data;
  }
}
