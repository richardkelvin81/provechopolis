import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrearVideo extends StatelessWidget {
  const CrearVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
              child: NestedScrollView(
                  headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                        CupertinoSliverNavigationBar(
                          backgroundColor: Colors.white,
                          largeTitle:const Text(
                            "Mi Perfil",
                            style: TextStyle(color: Colors.white),
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
                              child: const Icon(Icons.logout_sharp, color: Colors.white)),
                        )
                      ]),
                  body: Text('')
                )),
    );
  }
}