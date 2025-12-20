# Base Flutter Application

### Description

This project is based on the Clean Architecture concept and already contains:

- All base classes and working architecture
- Example screen with http request
- Design system (fonts and colors)

### Project structure

All Flutter code is located inside the `lib` folder. Under it you will find 4 packages:

- ```app``` - contains di, main and application files for initializations;
- ```core``` - all base classes needed for architecture, tools and global extensions;
- ```features``` - all screens (features) of the application. You should create your new feature right here;
- ```shared``` - design system, reusable dialogs and views, shared usecases, etc.

### Tech Stack

- State Management: [Riverpod](https://riverpod.dev/) (AsyncNotifier) — for application state management.
- Dependency Injection: [GetIt](https://pub.dev/packages/get_it) + [Injectable](https://pub.dev/packages/injectable) — for dependency injection and DI code generation.
- Networking: [Dio](https://pub.dev/packages/dio) — HTTP client for Dart.
- Architecture: Clean Architecture (Data, Domain, and Presentation layers).
- Design System: Custom design system (themes, colors, spacing) based on Material 3.

### Build and requirements:

- Flutter SDK: stable channel (recommended version: the one bundled with the project at the time of cloning);
- Dart SDK: comes with Flutter;
- Android Studio or IntelliJ IDEA with Flutter & Dart plugins;
- Android SDK (minimum is API level 21, recommended and tested on API level 34)

##### Build steps:

1. Clone the repository.
2. Ensure the project path contains only ASCII characters.
3. From the project root, run:
   ```
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
   And you good to go!
4. If you encounter build issues after changing paths or dependencies, run:
   ```
   flutter clean
   flutter pub get
   ```

##### Important notes for Windows users!

The project must be located in a path without non-ASCII characters (no Cyrillic, spaces are fine). Avoid placing the project inside Documents, especially if it is managed by OneDrive or Windows Controlled Folder Access. These restrictions are important for Flutter code generation, asset processing, and shader compilation.





