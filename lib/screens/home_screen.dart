import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:houlak/models/my_search_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Busca a tu artista \nfavorito',
                            style: TextStyle(fontSize: 25),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: SearchBar(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: SvgPicture.asset(
                      "assets/search.svg",
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: MySearchBar());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Buscar Artista", style: TextStyle(color: Colors.black)),
            Icon(
              Icons.search,
              color: Colors.black,
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12, blurRadius: 5, offset: Offset(0, 5)),
            ]),
      ),
    );
  }
}
