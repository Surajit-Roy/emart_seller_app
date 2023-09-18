import 'package:emart_seller/const/colors.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back, color: darkGrey,),
        ),
        title: boldText(text: "Product Title", color: fontGrey, size: 16.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxSwiper.builder(
                            autoPlay: true,
                            height: 350,
                            itemCount: 3,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1.0,
                            itemBuilder: (context, index) {
                              return Image.asset(imgProduct,
                                  width: double.infinity, fit: BoxFit.cover);
                            }),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        boldText(text: "Products title", color: fontGrey, size: 16.0),
                      
                        10.heightBox,
                        Row(
                          children: [
                            boldText(text: "Category", color: fontGrey, size: 16.0),
                            10.widthBox,
                            normalText(text: "Subcategory", color: fontGrey, size: 16.0),
                          ],
                        ),
                        10.heightBox,
                        VxRating(
                          isSelectable: false,
                          // value: double.parse(data['p_rating']),
                          value: 3.0,
                          onRatingUpdate: (value) {},
                          normalColor: textfieldGrey,
                          selectionColor: golden,
                          count: 5,
                          size: 25,
                          maxRating: 5,
                        ),
                         10.heightBox,
                        boldText(text: "\$300.0", color: red, size: 18.0),

                        20.heightBox,
    
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: boldText(text: "Color", color: fontGrey),
                                  // child: "Color: ".text.color(textfieldGrey).make(),
                                ),
                                Row(
                                  children: List.generate(
                                      3,
                                      (index) => 
                                          VxBox()
                                              .size(40, 40).color(Vx.randomPrimaryColor)
                                              .margin(
                                                  const EdgeInsets.symmetric(horizontal: 4)).roundedFull.make().onTap(() {}),
                                      ),
                                )
                              ],
                            ),
                            10.heightBox,
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: boldText(text: "Quantity", color: fontGrey),
                                  // child: "Quantity: ".text.color(textfieldGrey).make(),
                                ),
                                normalText(text: "20 items", color: fontGrey),
                              ]
                            ),
                          ],
                        ).box.white.padding(EdgeInsets.all(8)).make(),
                        Divider(),
                        10.heightBox,
                        boldText(text: "Description", color: fontGrey),
                      // "Description"
                      //     .text
                      //     .color(darkFontGrey)
                      //     .fontFamily(semibold)
                      //     .make(),
                         10.heightBox,
                      normalText(text: "Description of this item", color: fontGrey),
                      ],
                    ),
                  ),             
            ],
          ),
        ),
      ),
    );
  }
}