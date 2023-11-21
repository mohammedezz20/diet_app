
import 'package:bloc/bloc.dart';
import 'package:diet_app/Shared/bloc/LangState.dart';
import 'package:diet_app/Shared/network/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangCubit extends Cubit<LangInitState> {
  LangCubit() : super(LangInitState());
  static LangCubit get(context) => BlocProvider.of(context);


bool isArabic=false;
var selectedLanguage;

changeLang(bool arabic){
  
  if(arabic)
  {
    selectedLanguage='ar';
    isArabic=arabic;
      emit(ChangeAppLanguageArabicState());
  }else{
      selectedLanguage='en';
    isArabic=arabic;
      emit(ChangeAppLanguageEnglishState());
  }
  CachHelper.saveData(key: 'isArabic', value: arabic);
 

}


}
