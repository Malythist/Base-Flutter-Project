# Core extensions

This directory contains reusable Dart and Flutter extensions.

## Philosophy

Extensions must:
- Be small and focused
- Reduce boilerplate
- Contain no business logic
- Be safe to use across the project

If logic becomes complex, it should be moved to a service or utility.

## Theme extensions

Provide short access to theme values.

Example:
context.colors.primary
context.text.titleMedium

Purpose:
- Avoid repetitive Theme.of(context) calls
- Improve UI readability

## AsyncValue extensions

Simplify rendering AsyncValue.

Example:
async.whenWidget(
loading: LoadingView(),
error: ErrorView(...),
data: ContentView(...),
)

Purpose:
- Reduce AsyncValue boilerplate
- Make screen code declarative

## Image extensions

Wrap cached_network_image.

Example:
imageUrl.networkImage(width: 100, height: 100)

Purpose:
- Centralize image loading
- Provide caching and placeholders

## Snackbar extensions

Example:
context.showSnack("Saved")
context.showErrorSnack("Error")

Purpose:
- Centralize user notifications
