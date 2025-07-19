import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:dictonary_app/models/dictionary_model.dart';
import 'package:dictonary_app/services/dictionary_service.dart';
import 'package:dictonary_app/services/translation_service.dart';
import 'package:dictonary_app/ui_helper/colors/app_pallete.dart';
import 'package:dictonary_app/ui_helper/widgets/card_widget.dart';
import 'package:dictonary_app/ui_helper/widgets/customText.dart';
import 'package:dictonary_app/ui_helper/widgets/custom_elevatedbtn.dart';
import 'package:dictonary_app/ui_helper/widgets/custom_textfied.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final controller = TextEditingController();

  DictionaryModel? currentWord;
  String hindiTranslation = '';
  bool isLoading = false;

  List<String> synonym = [];

  String capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  Future<void> handleSearch() async {
    final word = capitalize(controller.text.trim());
    if (word.isEmpty) return;


    final connectivityResult = await Connectivity().checkConnectivity();
    final isConnected = connectivityResult != ConnectivityResult.none;

    if (!isConnected) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("No internet connection")));
      return;
    }

    setState(() => isLoading = true);

    final data = await DictionaryService.fetchWordData(word);

    if (data != null) {
      final translation = await TranslationService.translateToHindi(word);

      setState(() {
        currentWord = data;
        synonym = data.synonyms;
        hindiTranslation = translation;
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Word not found")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextfied(
                controller: controller,
                hinttext: 'Enter word here',
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
              SizedBox(height: 10),

              if (isLoading)
                Center(child: customLoader())
              else if (currentWord != null)
                CardWidget(
                  engWord: currentWord!.word,
                  hindiWord: hindiTranslation,
                  classWord: currentWord!.wordClass,
                  defList: currentWord!.definitions,
                  exampleList: currentWord!.examples,
                  phoneticWord: currentWord!.phonetic,
                ),

              SizedBox(height: 10),

              if (synonym.isNotEmpty && !isLoading)
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: synonym.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 8,
                        ),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          color: AppPallete.synonymGrey,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            constraints: const BoxConstraints(minWidth: 80),
                            child: Center(
                              child: Customtext(
                                text: synonym[index],
                                color: AppPallete.iconGreen,
                                size: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: CustomElevatedButton(
            btnName: 'Search',
            callback: handleSearch,
          ),
        ),
      ),
    );
  }

  Widget customLoader() {
    return LoadingAnimationWidget.flickr(
      leftDotColor: Colors.blue,
      rightDotColor: Colors.redAccent,
      size: 70,
    );
  }
}
