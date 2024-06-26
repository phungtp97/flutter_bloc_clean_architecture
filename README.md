# Flutter Bloc Clean Architecture

A boilerplate project to demonstrate the implementation of Clean Architecture using Bloc in Flutter. This repository is designed to serve as a starting point for Flutter developers who want to implement Clean Architecture principles in their applications.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This project is a practical example of using Clean Architecture with the Bloc state management library in Flutter. Clean Architecture aims to separate concerns, making the system more understandable, flexible, and maintainable.

## Features
- **Separation of Concerns**: Divides the project into data, domain, and presentation layers.
- **Dependency Injection**: Uses `injectable` and `get_it` for managing dependencies.
- **Error Handling**: Implements `Either` type from the `dartz` package for functional error handling.
- **Localization**: Supports multiple languages with a `LocaleBuilder` class.

## Project Structure
The project is structured into three main layers:

1. **Infrastructure Layer**: Data-getter Layer. handles data operations such as network requests, database access, and data caching, and repository implementation.


    ```
    lib/
    └── feature/
        └── infrastructure/
            ├── datasource/
            ├── model/
            └── repository/
    ```

2. **Domain Layer**: Domain Entity with Domain Logic Layer. Contains business/domain logic, including entities, and repository interfaces.

    ```
    lib/
    └── feature/
        └── domain/
            ├── entity/
            └── repository/
    ```

3. **Presentation Layer:** This layer is responsible for displaying the data to the user and interpreting the user's actions. It includes widgets, blocs, and pages.

    ```
    lib/
    └── feature/
        └── presentation/
            ├── bloc/
            ├── page/
            └── widget/
    ```

Each layer has its own responsibility and they communicate with each other through defined interfaces. This separation of concerns makes the code more maintainable and testable.
