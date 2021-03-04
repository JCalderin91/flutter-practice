import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/pages/homepage.dart';
import 'package:api_rest_app/size_config.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isExpanded = true;
  bool _showForm = false;
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                if (details.delta.dy < 0) {
                  if (_isExpanded && !_isAnimated) {
                    _isExpanded = false;
                    _isAnimated = true;
                  }
                } else {
                  if (!_isExpanded && !_isAnimated) {
                    _showForm = false;
                    _isExpanded = true;
                    _isAnimated = true;
                  }
                }
              });
            },
            child: AnimatedContainer(
              curve: Curves.easeInCubic,
              height: _isExpanded
                  ? SizeConfig.screenHeight
                  : SizeConfig.screenHeight * 0.55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.3),
                    offset: Offset(0, 0),
                    blurRadius: 30,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/wallpaper.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.hardLight,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(!_isExpanded ? 40 : 0),
                  bottomRight: Radius.circular(!_isExpanded ? 40 : 0),
                ),
              ),
              duration: Duration(milliseconds: 400),
              onEnd: () {
                setState(() {
                  if (!_isExpanded) _showForm = true;
                  _isAnimated = false;
                });
              },
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Bienvenido',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_isExpanded)
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                        size: 14,
                      ),
                    Text(
                      _isAnimated ? 'aimated' : 'static',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _isExpanded
                          ? 'Desliza para ingresar'
                          : 'Desliza para volver atrás',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    if (!_isExpanded)
                      Icon(
                        Icons.arrow_downward_sharp,
                        color: Colors.white,
                        size: 14,
                      ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          _showForm
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    children: [
                      CutomTextfield(
                          hint: 'Correo elétronico',
                          icon: Icon(Icons.people_alt)),
                      CutomTextfield(
                          hint: 'Contraseña', icon: Icon(Icons.lock)),
                      const SizedBox(height: 10),
                      Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButtom(onTab: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      })
                    ],
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final Function onTab;
  const CustomButtom({
    Key key,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTab();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Iniciar sesión',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CutomTextfield extends StatelessWidget {
  final String hint;
  final Icon icon;
  const CutomTextfield({
    Key key,
    this.hint,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            icon: icon,
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
              color: kTextColor.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
