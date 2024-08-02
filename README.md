
# Cash App Demo

A flutter app that shows the current amount of cash the user has, a page where the user could send money, and a transaction history page.


## Running the app

Please use flutter v3.22.3

Clone the project

```bash
  git clone git@github.com:dbenedictos/cash_app.git
```

Go to the project directory

```bash
  cd cash_app
```

Install dependencies

```bash
  flutter pub get
```
Generate files

```bash
  dart run build_runner build --delete-conflicting-outputs --verbose 
```
### To run the unit test.
```bash
  flutter pub global activate test_cov_console
```
```bash
  flutter test --coverage && flutter pub global run test_cov_console
```
#### This is optional.

Install flutter version manager on your computer. Follow this [documention](https://fvm.app/documentation/getting-started/installation)

After installation, run this on the project root directory:
```bash
  fvm install 3.22.3
```
This should generate a `.fvm` folder. Make sure, in your IDE, the flutter version you are using is pointing to `.fvm/flutter_sdk`. This points to the flutter version you are currently using in flutter version manager.

Then run:

```bash
  fvm flutter pub get
```
and
```bash
  fvm dart run build_runner build --delete-conflicting-outputs --verbose
```
For running the unit test. The steps are the same as above but always `fvm` before `flutter`

