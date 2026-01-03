# Finding the Database on Android

## Database Location
The database `mickram.db` is stored in the app's private directory using `sqflite_sqlcipher`.

## How to Locate the Database

### Method 1: Using the App
1. Run the app
2. Click the "Show Database Info" button
3. Check the console output for the database path

### Method 2: Using Android Studio
1. Connect your device/emulator
2. Open Android Studio
3. Go to **View → Tool Windows → Device File Explorer**
4. Navigate to: `data/data/com.example.encrypt_mc/databases/`
5. Look for `mickram.db`

### Method 3: Using ADB Command Line
```bash
# List databases
adb shell run-as com.example.encrypt_mc ls databases/

# Copy database to computer
adb shell run-as com.example.encrypt_mc cp databases/mickram.db /sdcard/
adb pull /sdcard/mickram.db

# Or directly pull (if you have root)
adb pull data/data/com.example.encrypt_mc/databases/mickram.db
```

### Method 4: Using Flutter DevTools
1. Run the app with `flutter run`
2. Open DevTools: `flutter pub global run devtools`
3. Go to the Flutter Inspector tab
4. Check the console output for database path information

## Important Notes
- The database is encrypted with SQLCipher
- The database is recreated each time you run the `convert()` function
- Check the console output for detailed database information including:
  - Full path
  - File existence
  - File size
  - Last modified time

## Troubleshooting
If you can't find the database:
1. Make sure the app has run the conversion process
2. Check the console output for any error messages
3. Verify the package name matches your app's actual package name
4. Ensure you're using the correct device/emulator

## Package Name
The default package name is `com.example.encrypt_mc`. If you've changed this, update the paths accordingly.
