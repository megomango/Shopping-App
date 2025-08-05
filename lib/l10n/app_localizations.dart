import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to ShopCraft'**
  String get welcome;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Your Premium Shopping \n Experience'**
  String get description;

  /// No description provided for @productsNum.
  ///
  /// In en, this message translates to:
  /// **'Our Products'**
  String get productsNum;

  /// No description provided for @featuredProducts.
  ///
  /// In en, this message translates to:
  /// **'Featured Products'**
  String get featuredProducts;

  /// No description provided for @hotOffers.
  ///
  /// In en, this message translates to:
  /// **'Hot Offers '**
  String get hotOffers;

  /// No description provided for @createAcc.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAcc;

  /// No description provided for @description1.
  ///
  /// In en, this message translates to:
  /// **'Join ShopCraft today'**
  String get description1;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get name;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter Your full Name'**
  String get nameLabel;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get emailLabel;

  /// No description provided for @passLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Password'**
  String get passLabel;

  /// No description provided for @confirmPass.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPass;

  /// No description provided for @confirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Your Password'**
  String get confirmLabel;

  /// No description provided for @welcomeSignIn.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeSignIn;

  /// No description provided for @description2.
  ///
  /// In en, this message translates to:
  /// **'Sign In to ShopCraft'**
  String get description2;

  /// No description provided for @dialog1.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get dialog1;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @dialog2.
  ///
  /// In en, this message translates to:
  /// **'Signed in successfully'**
  String get dialog2;

  /// No description provided for @offer1_title.
  ///
  /// In en, this message translates to:
  /// **'50% Off \n Electronics'**
  String get offer1_title;

  /// No description provided for @offer1_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Limited time offer \n on all tech \n gadgets'**
  String get offer1_subtitle;

  /// No description provided for @offer1_label.
  ///
  /// In en, this message translates to:
  /// **'50% OFF'**
  String get offer1_label;

  /// No description provided for @offer2_title.
  ///
  /// In en, this message translates to:
  /// **'Free \n  Shipping \n  Weekend'**
  String get offer2_title;

  /// No description provided for @offer2_subtitle.
  ///
  /// In en, this message translates to:
  /// **'No delivery \n  charges on \n  orders above \n \$50'**
  String get offer2_subtitle;

  /// No description provided for @offer2_label.
  ///
  /// In en, this message translates to:
  /// **'FREE SHIP'**
  String get offer2_label;

  /// No description provided for @offer3_title.
  ///
  /// In en, this message translates to:
  /// **'Buy 2 Get 1 Free'**
  String get offer3_title;

  /// No description provided for @offer3_subtitle.
  ///
  /// In en, this message translates to:
  /// **'On selected \n accessories and \n peripherals'**
  String get offer3_subtitle;

  /// No description provided for @offer3_label.
  ///
  /// In en, this message translates to:
  /// **'B2G1'**
  String get offer3_label;

  /// No description provided for @offer4_title.
  ///
  /// In en, this message translates to:
  /// **'Student \n Discount'**
  String get offer4_title;

  /// No description provided for @offer4_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Extra 20% off with \n valid student ID'**
  String get offer4_subtitle;

  /// No description provided for @offer4_label.
  ///
  /// In en, this message translates to:
  /// **'20% OFF'**
  String get offer4_label;

  /// No description provided for @offer5_title.
  ///
  /// In en, this message translates to:
  /// **'Bundle Deals'**
  String get offer5_title;

  /// No description provided for @offer5_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Save more when \n you buy complete \n setups'**
  String get offer5_subtitle;

  /// No description provided for @offer5_label.
  ///
  /// In en, this message translates to:
  /// **'BUNDLE'**
  String get offer5_label;

  /// No description provided for @featured_title_1.
  ///
  /// In en, this message translates to:
  /// **'Ambient Lighting'**
  String get featured_title_1;

  /// No description provided for @featured_title_2.
  ///
  /// In en, this message translates to:
  /// **'Modern Accessories'**
  String get featured_title_2;

  /// No description provided for @featured_title_3.
  ///
  /// In en, this message translates to:
  /// **'Tech Gadgets Sale'**
  String get featured_title_3;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
