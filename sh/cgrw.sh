myuname=$USER

sudo rm -r /Users/$myuname/.pub-cache   
sudo rm -r ./pubspec.lock 
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch