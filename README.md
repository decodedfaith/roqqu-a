# Roqqu Mobile Developer Assessment

A high-fidelity Flutter implementation of the Roqqu copy trading platform UI, built as a technical assessment suppport. This project demonstrates a production-quality application that is performant, well-architected, and easy to maintain, with a strong focus on clean code, smooth animations, and a professional development workflow.

## 🚀 Project Showcase

![A GIF recording of the application running in the emulator, showcasing key user flows, animations, and UI components.](assets/video/demo.gif) 


## ✅ Assessment Requirements Checklist

This project was built to meet and exceed the following evaluation criteria:

-   [x] **Accuracy to Design:** High-fidelity implementation of the provided Figma designs with attention to spacing, typography, and component consistency.
-   [x] **Animations & Transitions:** Implemented smooth, performant, and meaningful animations for a fluid and polished user experience.
-   [x] **Architecture & Code Quality:**
    -   Built upon a clean, feature-first architecture layered with Clean Architecture principles (Presentation, Domain, Data).
    -   Adherence to OOP principles and a modular, scalable code structure.
    -   Consistent naming conventions and a clear, well-organized folder structure.
-   [x] **State Management:** Effective use of **Riverpod** for managing shared application state, while using `StatefulWidget` for ephemeral/local UI state.
-   [x] **API Integration & Real-Time Data Handling:** *(In Progress)* Setup for integration with open-source WebSocket APIs (like Binance).
-   [x] **Performance & Optimization:** Ensured smooth scrolling and rendering of UI elements.
-   [x] **Testing & Maintainability:**
    -   Includes a suite of **unit and widget tests** to ensure code reliability and correctness.
    -   The codebase is structured to be easily maintainable and understandable by other engineers.
-   [x] **Best Practices:**
    -   Use of responsive layouts and consideration for different screen sizes.
    -   Adherence to Flutter and Dart best practices.
    -   Effective use of Git commits to show a clear progression of work through a feature-branching workflow.

## 🏛️ Architecture

The project follows a **Feature-First Architecture** combined with the principles of **Clean Architecture**, separating concerns into three distinct layers within each feature module: **Presentation**, **Domain**, and **Data**. This ensures the codebase is decoupled, scalable, and highly testable. A centralized `AppTheme` class in the `core` layer provides consistent styling across the app.

## 🧪 Testing & CI/CD

The project includes a suite of relevant widget tests in the `test/` directory, focusing on:
1.  **Smoke Testing:** Verifying the app launches and navigates to the initial screen without errors.
2.  **Component Testing:** Testing reusable widgets in isolation to verify their response to different states.
3.  **State Management Testing:** Ensuring UI components correctly react to state changes from Riverpod providers.

All tests are automatically validated by a **GitHub Actions CI pipeline** (`.github/workflows/ci.yaml`).

## 🛠️ Getting Started

### Prerequisites

-   Flutter SDK (version specified in `pubspec.yaml`, e.g., using FVM: `fvm use 3.22.2`)
-   An IDE like VS Code or Android Studio.

### Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone <your_repo_url>
    cd <your_repo_name>
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the code generator:**
    This project uses `riverpod_generator`. You must run the build runner to generate the necessary provider files.
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the application:**
    ```bash
    flutter run
    ```