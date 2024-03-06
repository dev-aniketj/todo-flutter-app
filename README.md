# Todo Flutter App

Welcome to the Todo Flutter App repository! This is a simple Flutter application for managing your daily tasks. It follows the MVC (Model-View-Controller) architecture and utilizes the `get` package for state management and `get_storage` for local database storage.

## Project Structure

- **main.dart**: Entry point of the application.
- **app**
  - **controller**
    - **task_controller.dart**: Contains the controller logic for managing tasks.
  - **core**
    - **utils**
      - **keys.dart**: Contains key constants used throughout the application.
    - **values**
      - **colors.dart**: Defines color constants used for theming.
      - **strings.dart**: Contains string constants used throughout the application.
  - **models**
    - **task_models.dart**: Defines the data model for tasks.
  - **ui**
    - **pages**
      - **new_task.dart**: UI for adding a new task.
      - **task_list.dart**: UI for displaying the list of tasks.

## Features

- Add new tasks.
- View a list of tasks.
- Local storage for persistent data.
- Simple and intuitive user interface.

## Getting Started

1. Clone this repository.
2. Ensure you have Flutter installed on your machine.
3. Run `flutter pub get` to install dependencies.
4. Run the app using `flutter run`.

## Dependencies

- [get](https://pub.dev/packages/get): State management library for Flutter.
- [get_storage](https://pub.dev/packages/get_storage): Local storage library for Flutter.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or create a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to customize this README according to your specific project details and requirements.
