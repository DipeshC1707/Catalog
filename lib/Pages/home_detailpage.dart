import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widget/add_to_cart.dart';
import '../widgets/theme.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.make(),
              AddToCart(catalog: catalog,).wh(120, 50)
            ],
          ).p32(),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.convey,
                    edge: VxEdge.top,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyTheme.darkBluishColor)
                              .bold
                              .make(),
                          catalog.desc.text.xl
                              .textStyle(context.captionStyle)
                              .make(),
                          10.heightBox,
                          "Ut ipsa eos aut et sunt sit quo. Nisi aspernatur cumque sit aut est nihil porro error beatae. Ea enim itaque ab iste et. Repudiandae voluptas quis consectetur explicabo odio quasi eos eos quae. Est sed aut. Eius odit libero consequatur soluta quibusdam sit nihil."
                              .text.textStyle(context.captionStyle)
                              .make()
                              .p16()
                        ],
                      ).py64(),
                    )),
              )
            ],
          ),
        ));
  }
}
