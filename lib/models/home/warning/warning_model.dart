class WarningModel {
  String name;
  int level;
  int status;
  String faultDevice;
  String devicePosition;
  String faultPhenomenon;
  String findDate;

  String get levelName {
    switch (level) {
      case 1:
        return '一级';
      case 2:
        return '二级';
      case 3:
        return '三级';
      default:
        return '';
    }
  }

  String get statusName {
    switch (status) {
      case 0:
        return '待处理';
      case 1:
        return '处理中';
      case 2:
        return '已处理';
      default:
        return '';
    }
  }

  WarningModel({
    required this.name,
    required this.level,
    required this.status,
    required this.faultDevice,
    required this.devicePosition,
    required this.faultPhenomenon,
    required this.findDate,
  });
}
