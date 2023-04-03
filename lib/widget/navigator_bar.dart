import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/controller/logic_controller.dart';
import 'package:receta_cocina/pages/home_page.dart';
import 'package:receta_cocina/pages/perfil_page.dart';

class NavigatorCustomBar extends StatelessWidget {
  const NavigatorCustomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Provider.of<LogicController>(context);
    final List<Widget> _screens = [
      const HomePage(),
      PerfilPage(),
    ];

    return SafeArea(
      child: Scaffold(
          body: IndexedStack(
            index: logic.selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: logic.selectedIndex,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black,
            enableFeedback: true,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image(
                  image: const AssetImage("assets/img/home.png"),
                  color:
                      logic.selectedIndex == 0 ? Colors.orange : Colors.black,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: const AssetImage("assets/img/perfil.png"),
                  color:
                      logic.selectedIndex == 1 ? Colors.orange : Colors.black,
                ),
                label: "Perfil",
              ),
            ],
            onTap: (index) {
              logic.getIndex(index);
            },
          )),
    );
  }
}
