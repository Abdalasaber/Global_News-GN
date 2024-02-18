import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import '../../remote_db/dio_helper.dart';
import '../../../model/news_model/articles_model.dart';
import '../../remote_db/const.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<String> lab = [
    '',
    '',
  ];
  List<IconData> listIcon = [
    Icons.ballot,
    Icons.dashboard_customize,
  ];
  List<String> labNews = ['', '', '', ''];
  List<IconData> listIconNews = [
    Icons.health_and_safety,
    Icons.generating_tokens,
    Icons.sports,
    Icons.business_center,
  ];
  bool isSelect = true;
  final ValueNotifier<int> tabIndexBasicToggle = ValueNotifier(0);
  final ValueNotifier<int> tabBusinessIndexBasicToggle = ValueNotifier(0);
  final ValueNotifier<int> tabSportIndexBasicToggle = ValueNotifier(0);
  final ValueNotifier<int> tabGeneralIndexBasicToggle = ValueNotifier(0);
  final ValueNotifier<int> tabEntertainmentIndexBasicToggle = ValueNotifier(0);
  final ValueNotifier<int> tabTechnologyIndexToggle = ValueNotifier(0);
  final ValueNotifier<int> tabScienceIndexToggle = ValueNotifier(0);
  final ValueNotifier<int> tabNewsIndexBasicToggle = ValueNotifier(0);
  int currentIndex = 0;
  int activeIndex = 0;
  changeIndex(index) {
    activeIndex = index;
    emit(ChangeIndex());
  }

  bool isLast = false;
  isTrue() {
    isLast = true;
    emit(IsTrueState());
  }

  isFalse() {
    isLast = false;
    emit(IsFalseState());
  }

  onCategorySelected(index) {
    emit(OnCategorySelected());
  }

  tabToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  Colors.blueAccent,
                ],
                unSelectedBackgroundColors: const [Colors.white],
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabIndexBasicToggle.value = index;
                  emit(SelectedLabelState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );
  tabNewsSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabNewsIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIconNews,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  Colors.blueAccent,
                ],
                unSelectedBackgroundColors: const [Colors.white],
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                labels: labNews,
                selectedLabelIndex: (index) {
                  tabNewsIndexBasicToggle.value = index;
                  emit(SelectedLabelState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );

  ArticlesModel articlesModel = ArticlesModel();

  List<Articles> generalList = [];
  List<Articles> businessList = [];
  List<Articles> sportList = [];
  List<Articles> healthList = [];
  List<Articles> entertainmentList = [];
  List<Articles> technologyList = [];
  List<Articles> scienceList = [];

  getGeneralNews() {
    healthList.clear();
    emit(LoadingGeneralDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'us',
      'category': 'general',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      generalList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessGeneralDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorGeneralDataState());
    });
  }

  getBusinessNews() {
    emit(LoadingBusinessDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'us',
      'category': 'business',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      businessList = articlesModel.articles!;
      emit(SuccessBusinessDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorBusinessDataState());
    });
  }

  getSportNews() {
    emit(LoadingSportDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'us',
      'category': 'sport',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      sportList = articlesModel.articles!;
      emit(SuccessSportDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorSportDataState());
    });
  }

  getHealthNews() {
    healthList.clear();
    emit(LoadingHealthDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'us',
      'category': 'health',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      healthList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessHealthDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorHealthDataState());
    });
  }

  getEntertainmentNews() {
    entertainmentList.clear();
    emit(LoadingEntertainmentDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'us',
      'category': 'entertainment',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      entertainmentList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessEntertainmentDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorEntertainmentDataState());
    });
  }

  getTechnologyNews() {
    technologyList.clear();
    emit(LoadingEntertainmentDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'us',
      'category': 'technology',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      technologyList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessEntertainmentDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorEntertainmentDataState());
    });
  }

  getScienceNews() {
    scienceList.clear();
    emit(LoadingEntertainmentDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'us',
      'category': 'science',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      scienceList = articlesModel.articles!;
      emit(SuccessEntertainmentDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorEntertainmentDataState());
    });
  }

  tabBusinessToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabBusinessIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  Colors.blueAccent,
                ],
                unSelectedBackgroundColors: const [Colors.white],
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabBusinessIndexBasicToggle.value = index;
                  emit(SelectedBusinessLabelState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );

  tabGeneralToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabGeneralIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  Colors.blueAccent,
                ],
                unSelectedBackgroundColors: const [Colors.white],
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabGeneralIndexBasicToggle.value = index;
                  emit(SelectedBusinessLabelState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );
  tabEntertainmentToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabEntertainmentIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  Colors.blueAccent,
                ],
                unSelectedBackgroundColors: const [Colors.white],
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabEntertainmentIndexBasicToggle.value = index;
                  emit(SelectedBusinessLabelState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );
  tabTechnologyToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabTechnologyIndexToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  Colors.blueAccent,
                ],
                unSelectedBackgroundColors: const [Colors.white],
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabTechnologyIndexToggle.value = index;
                  emit(SelectedBusinessLabelState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );
  tabScienceToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabScienceIndexToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  Colors.blueAccent,
                ],
                unSelectedBackgroundColors: const [Colors.white],
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabScienceIndexToggle.value = index;
                  emit(SelectedBusinessLabelState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );
  tabSportToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabSportIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  Colors.blueAccent,
                ],
                unSelectedBackgroundColors: const [Colors.white],
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabSportIndexBasicToggle.value = index;
                  emit(SelectedBusinessLabelState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );

  void favorites(Articles item) {
    if (favoritesList.contains(item)) {
      favoritesList.remove(item);
      emit(SuccessAddFavoritesState());
    } else {
      favoritesList.add(item);
      emit(ErrorRemoveFavoritesState());
    }
  }

  List<Articles> businessEgList = [];
  List<Articles> sportEgList = [];
  List<Articles> healthEgList = [];
  List<Articles> entertainmentEgList = [];
  List<Articles> technologyEgList = [];
  List<Articles> scienceEgList = [];
  List<Articles> generalEgList = [];
  List<Articles> favoritesList = [];

  getHealthEgNews() {
    emit(LoadingHealthEgDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      healthEgList = articlesModel.articles!;
      emit(SuccessHealthEgDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorHealthEgDataState());
    });
  }

  getBusinessEgNews() {
    emit(LoadingBusinessEgDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      businessEgList = articlesModel.articles!;
      emit(SuccessBusinessEgDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorBusinessEgDataState());
    });
  }

  getSportEgNews() {
    emit(LoadingSportEgDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'eg',
      'category': 'sport',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      sportEgList = articlesModel.articles!;
      emit(SuccessSportEgDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorSportEgDataState());
    });
  }

  getEntertainmentEgNews() {
    entertainmentEgList.clear();
    emit(LoadingEntertainmentDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      entertainmentEgList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessEntertainmentDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorEntertainmentDataState());
    });
  }

  getTechnologyEgNews() {
    technologyEgList.clear();
    emit(LoadingEntertainmentDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      technologyEgList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessEntertainmentDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorEntertainmentDataState());
    });
  }

  getScienceEgNews() {
    scienceEgList.clear();
    emit(LoadingEntertainmentDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      scienceEgList = articlesModel.articles!;
      emit(SuccessEntertainmentDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorEntertainmentDataState());
    });
  }

  getGeneralEgNews() {
    healthEgList.clear();
    emit(LoadingGeneralDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'eg',
      'category': 'general',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      generalEgList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessGeneralDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorGeneralDataState());
    });
  }

  List<Articles> businessArList = [];
  List<Articles> sportArList = [];
  List<Articles> healthArList = [];
  List<Articles> entertainmentArList = [];
  List<Articles> technologyArList = [];
  List<Articles> scienceArList = [];
  List<Articles> generalArList = [];

  getGeneralArNews() {
    generalArList.clear();
    emit(LoadingGeneralDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'ae',
      'category': 'general',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      generalArList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessGeneralDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorGeneralDataState());
    });
  }

  getBusinessArNews() {
    emit(LoadingBusinessArDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'ae',
      'category': 'business',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      businessArList = articlesModel.articles!;
      emit(SuccessBusinessArDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorBusinessArDataState());
    });
  }

  getSportArNews() {
    emit(LoadingSportArDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'ae',
      'category': 'sport',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      sportArList = articlesModel.articles!;
      emit(SuccessSportArDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorSportArDataState());
    });
  }

  getHealthArNews() {
    emit(LoadingHealthArDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'ae',
      'category': 'health',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      healthArList = articlesModel.articles!;
      emit(SuccessHealthArDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorHealthArDataState());
    });
  }

  getEntertainmentArNews() {
    entertainmentArList.clear();
    emit(LoadingEntertainmentDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'ae',
      'category': 'entertainment',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      entertainmentArList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessEntertainmentDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorEntertainmentDataState());
    });
  }

  getTechnologyArNews() {
    technologyArList.clear();
    emit(LoadingEntertainmentDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'ae',
      'category': 'technology',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      // news.add(Articles.fromJson(value.data));
      articlesModel = ArticlesModel.fromJson(value.data);
      technologyArList = articlesModel.articles!;
      // news= articlesModel.articles!;
      emit(SuccessEntertainmentDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorEntertainmentDataState());
    });
  }

  getScienceArNews() {
    scienceArList.clear();
    emit(LoadingEntertainmentDataState());
    DioHelper.getData(url: endPoint, queryParameters: {
      'country': 'ae',
      'category': 'science',
      'apiKey': '68d4b3c4644145699812a7eb8009183a'
    }).then((value) {
      articlesModel = ArticlesModel.fromJson(value.data);
      scienceArList = articlesModel.articles!;
      emit(SuccessEntertainmentDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorEntertainmentDataState());
    });
  }
}
