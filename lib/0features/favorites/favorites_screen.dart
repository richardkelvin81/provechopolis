import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: CupertinoPageScaffold(
            child: NestedScrollView(
                headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                      CupertinoSliverNavigationBar(
                        backgroundColor: Colors.transparent,
                        largeTitle:const Text(
                          "Favoritos",
                          style: TextStyle(color: Colors.black),
                        ),
                        leading: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: null,
                            child: Icon(Icons.logout_sharp,
                                color: Colors.white.withOpacity(0))),
                        trailing: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                          
                            },
                            child: const Icon(Icons.logout_sharp, color: Colors.black)),
                      )
                    ]),
                body: Text('')
              ),
        )),
      );
    
  
  }
}