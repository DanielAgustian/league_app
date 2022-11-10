# League App

A Simple Project to see List Of English Premier league Team.

## Requirements
To compile in every form, you need to install [Flutter SDK](https://docs.flutter.dev/get-started/install). Other than Flutter SDK, there's some tools you need to install based on your tools and needs. Those tools are

- [Android Studio](https://developer.android.com/studio/install) : To Develop Application in Android
- [XCode](https://guide.macports.org/chunked/installing.html) : To develop Application in Apple Enviroment
- [CocoaPods](https://cocoapods.org/) : To help develop and use plugins in Apple Enviroment
- [VisualStudio](https://www.guru99.com/download-install-visual-studio.html) : to develop Desktop Windows application based on Flutter
- [VSCode](https://code.visualstudio.com/) or Any IDE you like: To Edit Code.

## How to run

After you have downloaded every requirement necessary, please first run this command:

```
D:\path\to\project\ > flutter doctor -v
```
If there isn't any error in text after that command, you can start run this command:

```
D:\path\to\project\ > flutter pub get
```
If there isn't any error in text after this command, you can start run this applcation based your needs.

### Android Application
To run application in Android, you need either (emulator)[https://code.tutsplus.com/tutorials/how-to-run-an-android-app-on-an-emulator--cms-38340] or real phone (using USB cable and debug mode in phone).

After that, please run this command:
```
D:\path\to\project\ > flutter run
```

### Web Application
To run Web Application, you need (Google Chrome)[https://support.google.com/chrome/answer/95346?hl=en&co=GENIE.Platform%3DDesktop].

After that, please run this command:
```
D:\path\to\project\ >  flutter run -d chrome --web-renderer html
```

### IOS Application
To install IOS Application you have 2 option: using (command line)[https://docs.flutter.dev/get-started/install/macos#set-up-the-ios-simulator] or using (xcode interface)[https://medium.com/front-end-weekly/how-to-test-your-flutter-ios-app-on-your-ios-device-75924bfd75a8].

### Desktop Application
TO Install Desktop Application you need to check if your developer mode in your OS.
After you allow developer mode, please put this command base on your OS:

```
D:\path\to\project\ >  flutter run -d windows
OR
$ flutter run -d macos
OR 
$ flutter run -d linux
```

## How to build 

### Mobile Application
To generate APK you need to make this command in your file project terminal.

```
E:/your/path/to/project/ > flutter build apk --split-per-abi

```

To generate your application file in IOS, please kindly check [this](https://docs.flutter.dev/deployment/ios) page. Thank you.

### Web Application
To generate build folder, you need to make this command in your file project terminal.

```
E:/your/path/to/project/ >  flutter build web --web-renderer html

```

### Desktop Application
To generate build folder, you need to make this command in your file project terminal.

```
E:/your/path/to/project/ >  flutter build windows
OR
E:/your/path/to/project/ >  flutter build macos
E:/your/path/to/project/ >  flutter build linux
```


