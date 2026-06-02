#!/bin/bash

echo "========================================="
echo "Building the Nuvio App (Release Variant)"
echo "========================================="
export CI_USE_DEBUG_SIGNING=true
./gradlew assembleFullRelease

APK_PATH="app/build/outputs/apk/full/release/app-full-release.apk"

if [ -f "$APK_PATH" ]; then
    echo ""
    echo "========================================="
    echo "Build Successful! APK located at:"
    echo "$APK_PATH"
    echo "========================================="
    echo ""
    echo "Instructions to install on WSA (Windows Subsystem for Android):"
    echo "1. Ensure WSA is running and Developer Mode is enabled in WSA settings."
    echo "2. Find the IP address for WSA (e.g. 127.0.0.1:58526 or a local IP)."
    echo "3. Connect using adb:"
    echo "   adb connect 127.0.0.1:58526"
    echo "4. Install the APK:"
    echo "   adb install $APK_PATH"
    echo "5. To launch it directly via deep link:"
    echo "   adb shell am start -a android.intent.action.VIEW -d \"nuvio://collections/<collectionid>/<catalogid>\" com.nuvio.app"
    echo "========================================="
else
    echo "Build failed. Could not find APK at $APK_PATH"
fi
