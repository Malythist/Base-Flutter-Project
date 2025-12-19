# Application initialization and DI

This directory contains application-level initialization logic.

## Responsibility

The `app` layer is responsible for:
- Application startup
- Dependency Injection (DI) initialization
- Global configuration required before the first screen is shown

## Dependency Injection

The project uses:
- **get_it** as the service locator
- **injectable** for code generation and registration

All dependencies are registered during application startup.

Typical responsibilities include:
- Initializing Dio and network-related classes
- Registering repositories, data sources, and use cases
- Providing configuration objects (e.g. ApiConfig)

## Initialization flow

1. The application entry point initializes Flutter bindings.
2. Dependency Injection is configured using generated injectable code.
3. The root widget is created after DI is fully initialized.

Important rule:
> No feature, repository, or controller should create dependencies manually.
> Everything must come from DI.

This guarantees testability and consistent lifecycle management.
