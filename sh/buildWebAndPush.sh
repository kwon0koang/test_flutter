# 빌드 후 kwon0koang.github.io/test_flutter 푸시
# /Users/user/kykdev/FlutterProjects/test_flutter
# /Users/user/kykdev/5000_EtcProject/kwon0koang.github.io

flutter build web --web-renderer canvaskit -t lib/main.dart
cp -r /Users/user/kykdev/FlutterProjects/test_flutter/build/web/* /Users/user/kykdev/5000_EtcProject/kwon0koang.github.io
cd /Users/user/kykdev/5000_EtcProject/kwon0koang.github.io
git checkout main
git add .
git commit -m "[kyk] test_flutter"
git push
cd /Users/user/kykdev/FlutterProjects/test_flutter
echo 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥


