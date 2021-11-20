import 'package:flutter/material.dart';
import 'package:houlak/models/my_search_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            leading: Container(),
            actions: [
              IconButton(
                  onPressed: () async {
                    showSearch(context: context, delegate: MySearchBar());
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 300,
                color: Colors.black87,
              )
            ]),
          )
        ],
      ),
    );
  }
}
