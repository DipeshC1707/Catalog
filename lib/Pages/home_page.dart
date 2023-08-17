// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:Catalogy/widgets/drawer.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
// import "../models/catalog.dart";
// import "../widgets/drawer.dart";
// import "../widgets/item_widget.dart";
import "dart:convert";
import 'package:velocity_x/velocity_x.dart';

import "../core/store.dart";
import "../models/cart.dart";
import "../models/catalog.dart";
import "../utils/routes.dart";
import "../widgets/home_widget/catalog_header.dart";
import "../widgets/home_widget/catalog_list.dart";
import "../widgets/theme.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadDatabase();
  }

  loadDatabase() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/images/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: VxBuilder(
          builder: (BuildContext context, store, VxStatus? status)=>
         FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            backgroundColor: MyTheme.darkBluishColor,
            child: const Icon(CupertinoIcons.cart),
          ).badge(color: Vx.red500,size:20,count: _cart.items.length,textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold)), mutations: const {AddMutation,RemoveMutation},
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ),
        drawer: MyDrawer(),);
  }
}
