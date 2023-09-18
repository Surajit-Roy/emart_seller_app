import 'package:emart_seller/views/widgets/custom_textfield.dart';
import 'package:emart_seller/views/widgets/text_style.dart';
import '../../const/const.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: editprofile, size: 16.0,),
        actions: [
          TextButton(onPressed: (){}, child: normalText(text: save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(imgProduct).box.width(150).roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: white
              ),
              onPressed: (){}, child: normalText(text: "Change Image", color: fontGrey),
            ),
            10.heightBox,
            Divider(color: white,),
            customTextField(label: name, hint: "eg. Surajit Roy"),
            10.heightBox,
            customTextField(label: password, hint: passwordHint),
            10.heightBox,
            customTextField(label: confirmPass, hint: passwordHint),
          ],
        ),
      ),
    );
  }
}