# Flutter Navigation App

This is a simple Flutter application that demonstrates the use of the `NavigationBar` widget for navigating between three different screens: **Home**, **Data**, and **Contact**. Each screen showcases unique functionality, ranging from static content to dynamic API calls and user forms.

---

## Features

### 1. **Home Page**

- Built using a `StatelessWidget`.
- Displays a background image in the top half of the screen.
- The bottom half contains a `Text` widget with:
  - A dark background and light-colored text.
  - Styling derived from the app's theme.
  - A transformation effect applied to the text.

### 2. **Data Page**

- Built using a `StatefulWidget`.
- Fetches data from an external API (returns JSON).
- Displays the data in a `ListView` or `GridView` using a `FutureBuilder`.
- Showcases at least two values from each object in the data array.

### 3. **Contact Page**

- Built using a `StatefulWidget` with a `Form` widget.
- Contains:
  - A `Text` title widget.
  - Three `TextFormField` widgets:
    - One field with autofocus.
    - One multiline text field.
  - An `ElevatedButton` to submit the form.
- Includes validation and `onSave` functionality for all fields.
