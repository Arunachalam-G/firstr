# firstr

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

## Main `lib/main.dart`
This is the entry point file of a flutter app. Configure root widget, firebase, flavour and other setup here.

## Flavours

This plugin is used to configure the debug, adhoc, staging and release environment for an app.
Refer the Flavour.buildSetup method in the main.dart file for more details.

## Resource files `lib/common/res`

mt_colors - Add colors required for this project in this file.
If this project supports dark mode, you can give corresponding dark mode color in the same MTColors object.

mt_dimension - This file contains the number resources like widget sizes and font sizes.

mt_images - This file contains the asset images path which can be used in the Image.asset() widget.

mt_theme - This file contains the centralized theme for this project. Add common text field decorations, text styles, button decorations and all other theme styles.

## Root widget `lib/src/app.dart`

app.dart - MyApp widget in this file is the root widget of this project. Use this file to configure your initial screen and other MaterialApp properties.

## Utilities `lib/utilities`

common - This folder contains basic utility manager classes like connectivity manager. Install the connectivity_plus plugin and uncomment the lines in the mt_connectivity_manager.dart file to use them.

## Widgets `lib/widgets`

Place the widgets which are commonly used in multiple screens here.

mt_loading_indicator.dart - Use MTLoadingIndicator.showLoading() and MTLoadingIndicator.hideLoading() methods to show and hide the progress indicator in any screen.

## AppConfig `lib/app_config.dart`
AppConfig - This class is used in combine with Flavors plugin. We have to pass debug/adhoc/staging/release instance of this class to the Flavour.buildSetup function in the main.dart file.
You can declare the build type variables (ex: base url, keys, etc) in this class and access them through out the app like (Flavour.instance as AppConfig).baseUrl.
