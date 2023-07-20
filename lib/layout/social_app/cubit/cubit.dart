import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/social_app/cubit/state.dart';

import '../../../Model/social_app/social_user_model.dart';
import '../../../Shared/components/constans.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? model;

  void getUserData()
  {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      if (value.data() != null) {
        model = SocialUserModel.fromJson(value.data()!);
        emit(SocialGetUserSuccessState());
      } else {
        emit(SocialGetUserErrorState("User data is null"));
      }
    })
        .catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));

    });
  }
}
