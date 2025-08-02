# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository is a monorepo containing multiple Flutter projects. Each sub-directory is a self-contained Flutter application.

- **com_test_flutter_app**: A basic Flutter project.
- **com_test_flutter_shop**: A Flutter project that uses `provider` and `riverpod` for state management.
- **com_test_flutter_transaction**: A Flutter project that uses the `intl` package for internationalization.
- **flutter_complete_guide**: A basic Flutter project.

## Common Development Tasks

To work on any of the sub-projects, first change into the project's directory. For example, to work on `com_test_flutter_shop`:

```bash
cd com_test_flutter_shop
```

Here are some common commands you can run from within a sub-project's directory:

### Get dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

### Run tests

```bash
flutter test
```

### Build the app

To build an Android App Bundle:
```bash
flutter build appbundle
```

To build an iOS app:
```bash
flutter build ios
```
