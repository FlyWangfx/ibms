import 'package:be_login/be_login.dart';
import 'package:be_widgets/widgets/components/password_text.dart';
import 'package:flutter/material.dart';
import 'package:ibms/res/assets_res.dart';
import 'package:ibms/utils/dart_packages/dio_util.dart';
import 'package:ibms/utils/data/memory_util.dart';
import 'package:ibms/utils/flutter_plugins/shared_preferences_util.dart';
import 'package:ibms/utils/other/routes.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({Key? key}) : super(key: key);

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// 密码是否可见
  final bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    initAccount();
  }

  void initAccount() async {
    String? username = await SharedPreferenceUtil.getString(SharedPreferenceUtil.USERNAME);
    String? password = await SharedPreferenceUtil.getString(SharedPreferenceUtil.PASSWORD);
    if (username != null && password != null) {
      setState(() {
        _usernameController.text = username;
        _passwordController.text = password;
      });
    } else {
      if (DioUtil.hostUrl != null && DioUtil.hostUrl!.isNotEmpty) {
        LoginModel? loginModel = await MemoryUtil.instance().getFirstAccount(DioUtil.hostUrl!);
        if (loginModel != null) {
          setState(() {
            _usernameController.text = loginModel.username;
            _passwordController.text = loginModel.password;
          });
        }
      }
    }
  }

  void _clickLogin() {
    Navigator.pushNamed(context, RouteSetting.TAB_PAGE_URL);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsRes.LOGIN_BG),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'IBMS',
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 240,
                      margin: const EdgeInsets.only(top: 80),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            controller: _usernameController,
                            //container
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              icon: Icon(Icons.person),
                              hintText: '账号/手机号',
                            ),
                            maxLength: 11,
                          ),
                          PasswordText(
                            hintText: '登录密码',
                            passwordController: _passwordController,
                            passwordVisible: _passwordVisible,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 36),
                      width: 240,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(106, 175, 247, 1),
                            Color.fromRGBO(21, 101, 242, 1),
                          ],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () => _clickLogin(),
                        child: const Text(
                          '登 录',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
