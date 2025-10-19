# Roqqu Mobile Developer Assessment

This is a Flutter-based mobile application built as a task-based assessment for the Mobile Developer position at Roqqu. The application provides an interface for a crypto copy trading platform, integrating with a WebSocket API to display real-time data.

## 🚀 Project Showcase



![Project Demo GIF](link_to_your_gif_or_video.gif)

## ✅ Assessment Requirements Checklist

This project was built to meet and exceed the following evaluation criteria:

-   [x] **Accuracy to Design:** High-fidelity implementation of the provided Figma designs with attention to spacing, typography, and component consistency.
-   [x] **Animations & Transitions:** Implemented smooth, performant, and meaningful animations for a fluid and polished user experience.
-   [x] **Architecture & Code Quality:**
    -   Built upon a clean, feature-first architecture layered with Clean Architecture principles (Presentation, Domain, Data).
    -   Adherence to OOP principles and a modular, scalable code structure.
    -   Consistent naming conventions and a clear, well-organized folder structure.
-   [x] **State Management:** Effective use of **Riverpod** for managing shared application state, while using `StatefulWidget` for ephemeral/local UI state.
-   [ ] **API Integration & Real-Time Data Handling:** *(In Progress)* Setup for integration with open-source WebSocket APIs (like Binance).
-   [x] **Performance & Optimization:** Ensured smooth scrolling and rendering of UI elements.
-   [x] **Testing & Maintainability:**
    -   Includes a suite of **unit and widget tests** to ensure code reliability and correctness.
    -   The codebase is structured to be easily maintainable and understandable by other engineers.
-   [x] **Best Practices:**
    -   Use of responsive layouts and consideration for different screen sizes.
    -   Adherence to Flutter and Dart best practices.
    -   Effective use of Git commits to show a clear progression of work through a feature-branching workflow.

## 🏛️ Architecture

The project follows a **Feature-First Architecture** combined with the principles of **Clean Architecture**. This approach isolates features into their own modules and separates concerns within each feature into three distinct layers:

-   **`Presentation`**: The Flutter UI layer, containing screens, widgets, and UI-specific state management. Widgets are kept "dumb" and react to state changes from providers.
-   **`Domain`**: The core of the application. It contains the business logic, models (entities), and abstract repository interfaces. This layer is pure Dart and has no dependencies on the UI or data sources.
-   **`Data`**: The implementation layer. It provides concrete implementations of the repositories defined in the domain layer and handles all interactions with external data sources (like the WebSocket API).

This structure ensures the codebase is decoupled, scalable, and highly testable.

## 🧪 Testing

This project includes a CI/CD pipeline configured with **GitHub Actions**. The pipeline automatically runs the following checks on every push and pull request to the `main` branch:

1.  **Code Analysis:** `flutter analyze` to enforce code quality and style.
2.  **Unit & Widget Tests:** `flutter test` to run all tests located in the `test/` directory.

This ensures that the codebase remains stable and reliable throughout development.

## 🛠️ Getting Started

### Prerequisites

-   Flutter SDK (version 3.22.0 or higher)
-   An IDE like VS Code or Android Studio

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/YOUR_USERNAME/roqqu-assessment-app.git
    cd roqqu-assessment-app
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the code generator:**
    This project uses `riverpod_generator`. You must run the build runner to generate the necessary files. For continuous development, use the `watch` command:
    ```bash
    dart run build_runner watch --delete-conflicting-outputs
    ```
    For a one-time build, use:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the application:**
    ```bash
    flutter run
    ```



---