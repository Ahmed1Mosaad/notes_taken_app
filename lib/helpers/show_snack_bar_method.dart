import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarMethod(BuildContext context,{required String text,required Color color,required Color colorBorder}) {
    return ScaffoldMessenger.of(context)
                          .showSnackBar( SnackBar(
                        content: Center(
                            child: Text(
                          text,
                          style:const TextStyle(color: white,fontSize: 14,fontWeight: FontWeight.bold),
                        )),
                        backgroundColor: color,
                        margin:
                          const  EdgeInsets.only(left: 18, right: 18, bottom: 18),
                        padding:const EdgeInsets.symmetric(vertical: 18),
                        behavior: SnackBarBehavior.floating,
                        duration:const Duration(seconds: 3),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                              const  BorderRadius.all(Radius.circular(18)),side: BorderSide(
                                  color: colorBorder,
                                  width: 2
                                )),
                      ));
  }
