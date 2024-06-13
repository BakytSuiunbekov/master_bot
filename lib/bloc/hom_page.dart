import 'package:flutter/material.dart';
import 'package:master_bot/constants/app_color.dart';
import 'package:master_bot/constants/app_text.dart';
import 'package:master_bot/bloc/slovar_pege.dart';
import 'package:master_bot/models/suroo_model.dart';
import 'package:master_bot/pages/test_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBaground,
      appBar: AppBar(
        backgroundColor: AppColor.appBarBaground,
        leading: IconButton(
          color: AppColor.appbarIcon,
          onPressed: () {},
          icon: const Icon(Icons.home_filled),
        ),
        centerTitle: true,
        title: const Text(
          AppText.appBarText,
          style: TextStyle(
            color: AppColor.appbarText,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: AppColor.appbarIcon,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        // TestPage(suroo: orusSurooIndex),
                        const SlovarPege(sozdor: []),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.black12,
                ),
                width: double.infinity,
                height: 50,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Cөздүк',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
