import 'dart:io';

import 'package:emart_seller/controllers/profile_controller.dart';
import 'package:emart_seller/views/auth_screen/loadingIndicator.dart';
import 'package:emart_seller/views/widgets/custom_textfield.dart';
import 'package:emart_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import '../../const/const.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          title: boldText(text: editprofile, size: 16.0,),
          actions: [
           controller.isloading.value?loadingIndicator(circleColor: white): TextButton(onPressed: ()async{
              controller.isloading(true);
              //if image is not selected
              if(controller.profileImgPath.value.isNotEmpty){
                await controller.uploadProfileImage();
              }else{
                controller.profileImageLink = controller.snapshotData['imgUrl'];
              }
              //if old password matches database
              if(controller.snapshotData['password'] == controller.oldpassController.text){
                await controller.changeAuthPassword(
                  email: controller.snapshotData['email'],
                  password: controller.oldpassController.text,
                  newpassword: controller.newpassController.text);
    
                await controller.updateProfile(
                imgUrl: controller.profileImageLink,
                name: controller.nameController.text,
                password: controller.newpassController.text
              );
              VxToast.show(context, msg: "Updated Profile!");
              }else if(controller.oldpassController.text.isEmptyOrNull && controller.newpassController.text.isEmptyOrNull){
                await controller.updateProfile(
                imgUrl: controller.profileImageLink,
                name: controller.nameController.text,
                password: controller.snapshotData['password']
                );
              }else{
                VxToast.show(context, msg: "Some error Occured!");
                controller.isloading(false);
              }
            }, child: normalText(text: save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:Column(
              children: [
                //data image url and controller path is empty
                    controller.snapshotData['imageUrl']==''&& controller.profileImgPath.isEmpty ? Image.asset(imgProduct, width: 90, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make():
                    //if data is not empty but controller path is empty
                    controller.snapshotData['imageUrl']!=''&& controller.profileImgPath.isEmpty? Image.network(controller.snapshotData['imageUrl'],width: 100,
                    fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(): 
                    //if both are empty
                    Image.file(File(controller.profileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                // Image.asset(imgProduct).box.width(150).roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white
                  ),
                  onPressed: (){
                    controller.changeImage(context);
                  }, child: normalText(text: "Change Image", color: fontGrey),
                ),
                10.heightBox,
                Divider(color: white,),
                customTextField(label: name, hint: "eg. Surajit Roy", controller: controller.nameController),
                30.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: boldText(text: "Change Your Password")),
                10.heightBox,
                customTextField(label: password, hint: passwordHint, controller: controller.oldpassController),
                10.heightBox,
                customTextField(label: confirmPass, hint: passwordHint, controller: controller.newpassController),
              ],
            ),
        ),
      ),
    );
  }
}