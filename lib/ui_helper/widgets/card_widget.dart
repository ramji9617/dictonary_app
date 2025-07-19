
import 'package:dictonary_app/ui_helper/colors/app_pallete.dart';
import 'package:dictonary_app/ui_helper/widgets/customText.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {

  final String engWord;
  final String hindiWord;
  final String classWord;
  final List<String> defList;
  final List<String> exampleList;
  final String phoneticWord;


  const CardWidget({super.key,

    required this.engWord,
    required this.hindiWord,
    required this.classWord,
    required this.defList,
     required this.exampleList,
    required this.phoneticWord


});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 440,
      ),
      child: SingleChildScrollView(
        child: Card(

          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          color: AppPallete.cardColor,

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Customtext(text: 'WORD' ,size: 14,fontWeight: FontWeight.bold,color: AppPallete.highlightGreen,),
                    Customtext(text: 'TRANSLATE' ,size: 14,fontWeight: FontWeight.bold,color: AppPallete.highlightGreen,),

                  ],
                      ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Customtext(text: engWord ,size: 22,fontWeight: FontWeight.bold,color: Colors.white,),
                    ConstrainedBox(constraints: BoxConstraints(
                      maxWidth: 80,
                      maxHeight: 40,
                    ),
                    child: Customtext(text: hindiWord ,size: 22,fontWeight: FontWeight.bold,color: Colors.white,)),

                  ],),
              ),

              SizedBox(height: 3,),

              Divider(color: AppPallete.phoneticGrey,thickness: 1,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Customtext(text: 'CLASS' , size: 14, color: AppPallete.highlightGreen, fontWeight: FontWeight.bold,),
                        Customtext(text: classWord ,size: 14,color: AppPallete.phoneticGrey,fontWeight: FontWeight.bold, )
                      ],
                    ),

                    SizedBox(width: 25,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Customtext(text: 'PHONETIC' , size: 14, color: AppPallete.highlightGreen, fontWeight: FontWeight.bold,),
                        Customtext(text: phoneticWord ,size: 14,color: AppPallete.phoneticGrey,fontWeight: FontWeight.bold, )
                      ],
                    ),

                  ],),
              ),


              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Customtext(text: 'DEFINITION' , size: 14, color: AppPallete.highlightGreen, fontWeight: FontWeight.bold,),
              ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // prevents scroll if nested
          itemCount: defList.length,
          itemBuilder: (context, index) {
          return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child:Customtext(text: "${index + 1}. ${defList[index]}" ,size: 14,color: AppPallete.phoneticGrey,fontWeight: FontWeight.bold, ),
          );}),
        ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Customtext(text: 'EXAMPLES' , size: 14, color: AppPallete.highlightGreen, fontWeight: FontWeight.bold,),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), // prevents scroll if nested
                    itemCount: defList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child:Customtext(text: "${index + 1}. ${defList[index]}" ,size: 14,color: AppPallete.phoneticGrey,fontWeight: FontWeight.bold, ),
                      );}),
              ),



          ],)
        ),
      ),
    );
  }
}
