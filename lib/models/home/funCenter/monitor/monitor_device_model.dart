class MonitorDevide {
  String name;
  String code;
  String location;
  String communicationType;
  String communicationProtocol;
  int type;
  int status;
  List<MonitorInfo> info;

  MonitorDevide({
    required this.name,
    required this.code,
    required this.location,
    required this.communicationType,
    required this.communicationProtocol,
    required this.type,
    required this.status,
    required this.info,
  });

  factory MonitorDevide.fromJson(Map<String, dynamic> json) {
    return MonitorDevide(
      name: json['name'],
      code: json['code'],
      location: json['location'],
      communicationType: json['communicationType'],
      communicationProtocol: json['communicationProtocol'],
      type: json['type'],
      status: json['status'],
      info: List<MonitorInfo>.unmodifiable(json['payList'].map((x) => MonitorInfo.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'location': location,
        'communicationType': communicationType,
        'communicationProtocol': communicationProtocol,
        'type': type,
        'status': status,
      };
}

class MonitorInfo {
  String time;
  String status;
  MonitorInfo({
    required this.time,
    required this.status,
  });

  factory MonitorInfo.fromJson(Map<String, dynamic> json) {
    return MonitorInfo(
      time: json['time'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'time': time,
        'status': status,
      };
}
