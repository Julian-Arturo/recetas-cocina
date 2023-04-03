import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/controller/logic_controller.dart';
import 'package:receta_cocina/pages/home_page/home_page.dart';
import 'package:receta_cocina/pages/perfil_page/perfil_page.dart';
import 'package:receta_cocina/utils/size_desing.dart';

class NavigatorCustomBar extends StatelessWidget {
  const NavigatorCustomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Provider.of<LogicController>(context);
    Responsive size = Responsive(context);

    final List<Widget> _screens = [
      const HomePage(),
      const PerfilPage(),
    ];

    return SafeArea(
      child: Scaffold(
          body: IndexedStack(
            index: logic.selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: logic.selectedIndex,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black,
            enableFeedback: true,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image(
                  width: size.width * 0.06,
                  image: const AssetImage("assets/img/home.png"),
                  color:
                      logic.selectedIndex == 0 ? Colors.orange : Colors.black,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image(
                  width: size.width * 0.05,
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
