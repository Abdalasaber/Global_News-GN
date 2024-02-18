part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class ChangeNavBarState extends NewsState {}
class ChangeIndex extends NewsState {}
class SelectedLabelState extends NewsState {}

class IsTrueState extends NewsState {}
class IsFalseState extends NewsState {}

class OnCategorySelected extends NewsState {}

class SelectedBusinessLabelState extends NewsState {}
class SelectedGeneralLabelState extends NewsState {}
// ----------------------Us State----------------------------
class LoadingGeneralDataState extends NewsState {}
class SuccessGeneralDataState extends NewsState {}
class ErrorGeneralDataState extends NewsState {}

class LoadingEntertainmentDataState extends NewsState {}
class SuccessEntertainmentDataState extends NewsState {}
class ErrorEntertainmentDataState extends NewsState {}

class LoadingBusinessDataState extends NewsState {}
class SuccessBusinessDataState extends NewsState {}
class ErrorBusinessDataState extends NewsState {}

class LoadingSportDataState extends NewsState {}
class SuccessSportDataState extends NewsState {}
class ErrorSportDataState extends NewsState {}

class LoadingHealthDataState extends NewsState {}
class SuccessHealthDataState extends NewsState {}
class ErrorHealthDataState extends NewsState {}

// ----------------------Eg State----------------------------
class LoadingBusinessEgDataState extends NewsState {}
class SuccessBusinessEgDataState extends NewsState {}
class ErrorBusinessEgDataState extends NewsState {}

class LoadingSportEgDataState extends NewsState {}
class SuccessSportEgDataState extends NewsState {}
class ErrorSportEgDataState extends NewsState {}

class LoadingHealthEgDataState extends NewsState {}
class SuccessHealthEgDataState extends NewsState {}
class ErrorHealthEgDataState extends NewsState {}

// ----------------------Ar State----------------------------
class LoadingBusinessArDataState extends NewsState {}
class SuccessBusinessArDataState extends NewsState {}
class ErrorBusinessArDataState extends NewsState {}

class LoadingSportArDataState extends NewsState {}
class SuccessSportArDataState extends NewsState {}
class ErrorSportArDataState extends NewsState {}

class LoadingHealthArDataState extends NewsState {}
class SuccessHealthArDataState extends NewsState {}
class ErrorHealthArDataState extends NewsState {}

class SuccessAddFavoritesState extends NewsState {}
class ErrorRemoveFavoritesState extends NewsState {}
