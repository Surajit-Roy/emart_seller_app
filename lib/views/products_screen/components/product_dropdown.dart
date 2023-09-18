import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';
Widget productDropdown(){
  return DropdownButtonHideUnderline(child: DropdownButton<String>(
    value: null,
    hint: normalText(text: "Choose category", color: fontGrey),
    isExpanded: true,
    items: [], 
    onChanged: (Value){})).box.padding(EdgeInsets.symmetric(horizontal: 4)).white.roundedSM.make();
}