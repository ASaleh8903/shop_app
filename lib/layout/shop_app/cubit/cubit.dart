import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Shared/network/local/cache_helper.dart';
import 'package:shop_app/layout/shop_app/cubit/state.dart';

import '../../../Model/shop_app/categories_model/categories_model.dart';
import '../../../Model/shop_app/favourites_model/change_favourites_model.dart';
import '../../../Model/shop_app/favourites_model/favourite_model.dart';
import '../../../Model/shop_app/home_model/home_model.dart';
import '../../../Model/shop_app/login_model/login_model.dart';
import '../../../Modules/shop_app/categories/categories_screen.dart';
import '../../../Modules/shop_app/favourites/favourites_screen.dart';
import '../../../Modules/shop_app/products/products_screen.dart';
import '../../../Modules/shop_app/settings/settings_screen.dart';
import '../../../Shared/components/constans.dart';
import '../../../Shared/network/end_points.dart';
import '../../../Shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  final DioHelper dioHelper;
  final CacheHelper cacheHelper;
  HomeModel? homeModel;
  ShopCubit({required this.dioHelper, required this.cacheHelper})
      : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ShopLoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel?.data?.name);

      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel?.data?.name);

      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }

  ChangeFavoritsModel? favoritsModel;
  void changeFavoritesData(int productId) async {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());
    await DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      favoritsModel = ChangeFavoritsModel.fromJson(value.data);
      if (!favoritsModel!.status!) {
        //law fe 8alat yrga3ha blue tane mn nafso w el 3aks
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavoritesData();
      }
      //print(value.data);
      emit(ShopSuccessChangeFavoritesState(favoritsModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavoritesState(error));
      print(error);
    });
  }

  FavoritesModel? favoritesModell;
  void getFavoritesData() async {
    emit(ShopLoadingGetFavoritesState());
    await DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModell = FavoritesModel.fromJson(value.data);
      // printFullText("==================***==================");
      // printFullText(value.data.toString());
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      emit(ShopErrorGetFavoritesState(error));
      print(error);
    });
  }
}
