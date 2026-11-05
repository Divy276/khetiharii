<div align="center">

  <img src="assets/images/seller.png" alt="Khetiharii logo" width="120" />

  # 🌾 Khetiharii
  ### A farmer-first agricultural marketplace

  **Connecting farmers, buyers and local agricultural service providers.**

  [![Flutter](https://img.shields.io/badge/Flutter-Dart-02569B?logo=flutter)](https://flutter.dev)
  [![Firebase](https://img.shields.io/badge/Backend-Firebase-FFCA28?logo=firebase)](https://firebase.google.com)
  [![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-blue)](https://flutter.dev)

</div>

## About

Khetiharii is an AgriTech project focused on improving access to agricultural markets and essential farm services. Its intended ecosystem connects farmers with produce buyers, equipment owners, veterinarians and agricultural input suppliers.

The repository currently contains an early Flutter application foundation. The catalogue and cart use local demo data; production marketplace workflows and Firebase-backed data services are still planned.

## Product direction

| Module | Intended capability | Current status |
|---|---|---|
| Farmer marketplace | Create crop listings and connect with buyers | Planned |
| Buyer experience | Discover produce and place orders | Planned |
| Equipment rental | List machinery and manage bookings | Planned |
| Veterinary services | Discover vets and request consultations | Planned |
| Agricultural inputs | Browse farm supplies | Local demo catalogue |
| Smart farming | Weather and crop advisory | Planned |

## Technology

- Flutter and Dart for the cross-platform application
- Provider for the current cart state
- Firebase Core and Firebase Authentication dependencies are present
- Firebase initialization, production authentication, Firestore repositories, security rules and deployment configuration still need to be completed

## Getting started

1. Install Flutter and the Dart SDK.
2. Clone this repository:
   ```bash
   git clone https://github.com/Divyanshu8595/khetiharii.git
   cd khetiharii
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Configure Firebase for your own Firebase project using FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
5. Run the app:
   ```bash
   flutter run
   ```
6. Run tests:
   ```bash
   flutter test
   ```

Do not commit private service-account credentials or production secrets. Use your own Firebase project configuration and review platform-specific setup before release.

## Development priorities

- [ ] Configure Firebase initialization for supported platforms
- [ ] Implement real email/password authentication and profile creation
- [ ] Introduce role-based onboarding (farmer, buyer, equipment provider, veterinarian, input seller)
- [ ] Build Firestore-backed crop listings and buyer discovery
- [ ] Implement order lifecycle and notifications
- [ ] Add equipment rental and veterinary workflows
- [ ] Define Firestore security rules and automated tests
- [ ] Add CI checks for formatting, analysis and tests

## Contributing

Contributions are welcome. Create a feature branch, add tests for behavior changes, run `dart format .` and `flutter test`, then open a pull request.

## License

See the repository license file.
