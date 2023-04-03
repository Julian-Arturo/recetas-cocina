import 'package:flutter/material.dart';
import 'package:receta_cocina/utils/search_delegate.dart';
import 'package:receta_cocina/utils/size_desing.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Responsive size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      height: size.height * 0.3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: Color(0xffFF785B),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Prepara tu \nplato favorito",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
              onTap: () =>
                  showSearch(context: context, delegate: MealSearchDelegate()),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.only(left: 20),
                width: size.width * 0.7,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 5),
                          blurRadius: 5),
                    ]),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Image(
                    width: 20,
                    image: AssetImage("assets/img/search.png"),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
