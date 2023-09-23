import 'package:flutter/material.dart';
import 'package:flutter_app/screens/classes_screen.dart';
import 'package:flutter_app/screens/signup_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(100);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple[100]!,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            isMenuOpen ? Icons.arrow_upward : Icons.menu, // Ícone de menu aqui
            color: Colors.purple[300], // Cor das listras (roxas)
            size: 60, // Tamanho do ícone
          ),
          onPressed: () {
            setState(() {
              isMenuOpen = !isMenuOpen;
            });
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: widget.preferredSize,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isMenuOpen ? 60 : 0,
          child: isMenuOpen
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildMenuButton('Registro', () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      }),
                      buildMenuButton('Login', () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LogInScreen()));
                      }),
                      buildMenuButton('Turmas', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClassesScreen(),
                          ),
                        );
                      }),
                    ],
                  ),
                )
              : Container(),
        ),
      ),
    );
  }

  ElevatedButton buildMenuButton(String text, Function onPressed) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        primary: Colors.purple[300],
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
