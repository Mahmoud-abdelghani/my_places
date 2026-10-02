// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'My Places';

  @override
  String get searchPlaces => 'Search Places....';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get delete => 'Delete';

  @override
  String get myPlacesJournal => 'My Places Journal';

  @override
  String get addNewPlace => 'Add New Place';

  @override
  String get addPlaceImage => 'Add place image';

  @override
  String get addPlaceName => 'Add place Name';

  @override
  String get placeName => 'Place Name';

  @override
  String get addPlaceDescription => 'Add place discription';

  @override
  String get placeDescription => 'Place discription';

  @override
  String get addPlaceCategory => 'Add place category';

  @override
  String get getCurrentLocation => 'Get Current Location';

  @override
  String get savePlace => 'Save Place';

  @override
  String get noPlacesSavedYet => 'No places saved yet';

  @override
  String get savePhotosNotesAndLocations =>
      'Save photos, notes, and locations of your favorite spots.';

  @override
  String get addYourFirstPlace => 'Add your first place';
}
