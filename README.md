# flutter_bloc_arch

A Flutter project to show a practice example of Bloc Clean Architecture

## Clean Architecture

This project is structured following the principles of Clean Architecture. This architecture is designed to separate concerns, making the system more understandable, flexible, and maintainable. Here are some aspects of Clean Architecture that can be observed in the provided code:

1. **Separation of Concerns:** The project is divided into different layers, each with its own responsibility. For example, the `UserRepositoryIml` class is part of the domain layer and is responsible for business logic, while the `UserRemoteDataSource` is part of the data layer and is responsible for data retrieval.

2. **Dependency Rule:** The inner layers of the system should not depend on the outer layers. This is evident in the `UserRepositoryIml` class, which depends on abstractions (`UserRemoteDataSource`) rather than on concrete implementations.

3. **Use of Interfaces:** Interfaces are used to define the protocols for communication between different layers of the system. For example, `UserRepositoryIml` is an implementation of the `UserRepository` interface.

4. **Inversion of Control:** The project uses dependency injection (as indicated by the `@LazySingleton` annotation), which is a technique that helps to invert the control. This means that the control of objects is taken out of the hands of the classes and moved to a central place in the system.

5. **Error Handling:** The project uses the `Either` type from the `dartz` package for error handling. This is a functional programming concept that allows you to work with two types of objects (like success and failure) in a clean and predictable way.

6. **Localization:** The project has a `LocaleBuilder` class that helps to manage different locales. This is a good practice for supporting multiple languages in the application.

Remember, the goal of Clean Architecture is to make the system easy to understand, develop, test, and maintain. It's not about the specific tools or frameworks you use, but rather about how you structure your code.

## Project Structure

This project follows the principles of Clean Architecture and is divided into three main layers:

1. **Data Layer:** This layer is responsible for handling all data-related operations such as network requests, database access, and data caching. It includes classes like `UserRemoteDataSource` and `LocaleRepositoryIml`.

    ```
    lib/
    └── feature/
        └── data/
            ├── datasource/
            ├── model/
            └── repository/
    ```

2. **Domain Layer:** This layer contains all the business logic of the application. It includes entities, use cases, and repositories interfaces. An example of a class in this layer is `UserRepositoryIml`.

    ```
    lib/
    └── feature/
        └── domain/
            ├── entity/
            ├── usecase/
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
