import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/orders_screen/order_details.dart';
import 'package:emart_seller/views/widgets/appbar_widget.dart';
import 'package:emart_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(orders),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) => ListTile(
                    onTap: (){
                      Get.to(()=> OrderDetails());
                    },
                    tileColor: textfieldGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    title: boldText(text: "9029383810221", color: purpleColor),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_month, color: fontGrey,),
                            10.widthBox,
                            boldText(text: intl.DateFormat().add_yMd().format(DateTime.now()), color: fontGrey),

                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.payment, color: fontGrey,),
                            10.widthBox,
                            boldText(text: unpaid, color: red)

                          ],
                        ),
                      ],
                    ),
                    trailing: boldText(text: "\$40.0", color: purpleColor, size: 16.0),
                  ).box.margin(EdgeInsets.only(bottom:6)).make(),
                  ),
          ),
        ),
      ),
    );
  }
}