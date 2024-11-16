import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForHomePage/NotesCubit/notes_cubit.dart';
import 'package:notes_application/models/container_item_model.dart';
import 'package:notes_application/widgets/container_card.dart';

// abstact class كل حاجه عشان  هو  SearchDelegate من ال  extends جديد بي   class اضطرنا الى استخدام
class CustomSearchDelegate extends SearchDelegate {
  ContainerItemModel? selectedModel;
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(appBarTheme: AppBarTheme(
      color: black,
    ),
    iconButtonTheme: IconButtonThemeData(
      style:ElevatedButton.styleFrom(
        iconColor: white.withOpacity(.6)
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: white,
      hintStyle: TextStyle(color: white.withOpacity(.6)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: orange.withOpacity(.8)
        )
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: orange.withOpacity(.8)
        )
      ),
    ),
    scaffoldBackgroundColor:black,
    
    );
  }
  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle {
    return TextStyle(color: white);
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    /* 
     *  وبتستخدمها عشان تحط ايكونة مثلا فى ال الاخر  List<Widgets> بتاخد  actions زى ال 
     *  methods  موجود فى كل ال  query اسمه  variable فى عملية البحث يتم تخزينه داخل   TextField  اى شىء داخل ال 
    */
    return [
      IconButton(
          onPressed: () {
            // query=controller او يدخل اى قيمه على حسب حيث ان ال  query او ال  TextField يصفرلى ال  button اول لما ادوس على ال
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // * بالظبط leading زى ال
    return IconButton(
        onPressed: () {
          //search فى حالة غلق ال  close نستخدم
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ContainerItemModel>? modelList =
        BlocProvider.of<NotesCubit>(context).modelList;
    // فاضيه مكتبتش فيها حاجه textField فى حالة كانت ال
    // كلها list بتحط ال
    if (query == '') {
      return ListView.builder(
          itemCount: modelList!.length,
          itemBuilder: (conetxt, index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: InkWell(
                onTap: () {
                  query = modelList[index].title;
                  selectedModel = modelList[index];
                  showResults(context);
                },
                child: Card(
                    color: black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white.withOpacity(.2),
                    )
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        '${modelList[index].title}',
                        style: TextStyle(
                          color: Color(modelList[index].color),
                          fontSize: 20,
                        ),
                      ),
                    )),
              ),
            );
          });
    } else {
      // variable بنرميه ف  (query) textField لو بيبدأ باول حرف كتبته فى ال  item هنا بنحدد شرط وهو ان ال
      List<ContainerItemModel> filteredList = modelList!.where((item) {
        return item.title.startsWith(query);
      }).toList();
      return ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (conetxt, index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: InkWell(
                onTap: () {
                  query = filteredList[index].title;
                  selectedModel = filteredList[index];
                  showResults(context);
                },
                child: Card(
                  color: black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white.withOpacity(.2),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '${filteredList[index].title}',
                      style: TextStyle(
                        color: Color(filteredList[index].color),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    if (selectedModel == null) {
      return Center(
        child: Text('No Data Avaliable',style: TextStyle(color: white),),
      );
    } else {
      return Container(
        child: Column(
          children: [
            Spacer(),
            ContainerCard(model: selectedModel!),
            Spacer(
              flex: 15,
            ),
          ],
        ),
      );
    }
  }
}
