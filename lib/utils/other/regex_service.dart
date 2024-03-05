class RegexService {
  static bool validatePassWord(String password) {
    RegExp passWord = RegExp(r"(?=^.{8,16}$)(?=.*[a-zA-Z0-9])(?=.*\d).*$");
    return passWord.hasMatch(password);
  }

  static bool validateMob(String mob) {
    RegExp mobNum = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    return mobNum.hasMatch(mob);
  }

  static bool validateMNumber1(String num, String head) {
    RegExp dataNum = RegExp(r"^-?[1-9]\d{0,"
        "$head"
        "}\$");
    return dataNum.hasMatch(num);
  }

  static bool validateMNumber2(String num, List len) {
    RegExp dataNum = RegExp(r"^(-?)(\d{1,"
        "${len[0]}"
        "})\\.(\\d{1,"
        "${len[1]}"
        "})"
        "\$");
    return dataNum.hasMatch(num);
  }

  static bool isFullUrl(String url){
    RegExp dataNum = RegExp(r"https{0,1}://");
    return dataNum.hasMatch(url);
  }
  
  static String replaceDouble(String s) {
    RegExp replaceZero = RegExp(r"(?:\.0*|(\.\d+?)0+)$");
    s = s.replaceAll(replaceZero, '');
    return s == '' ? '0' : s;
  }
}
