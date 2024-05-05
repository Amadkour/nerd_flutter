# nerd_flutter

To facilitate a faster and more thorough code review process, it's essential to provide comprehensive documentation of your solution. Here's a breakdown of the key components of our approach:

- Choice of State Management:
    In this project, I opted to utilize the Bloc state management pattern, specifically the Cubit version. While the GetX ecosystem offers numerous features, many of which are not required for this test application, Cubit provides a simpler alternative with easier testing capabilities.
- Dependency Injection with GetIt Provider:
    To implement the Dependency Injection pattern, particularly the Inversion of Control (IoC), I integrated the GetIt Provider. This allows for more flexible and manageable dependency management within the application.
- Feature Splitting and MVC Pattern:
    The application's features are divided into three distinct components: login, recipe, and recipe profile. Each feature follows the Model-View-Controller (MVC) pattern for structured and modular development.
- Core File for Shared Components:
    All shared components and utilities are isolated within the core file. This ensures that common functionalities can be easily accessed and utilized across all features of the application.

