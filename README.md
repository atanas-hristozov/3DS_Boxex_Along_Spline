# Box Along Spline – 3ds MaxScript Tool

This MaxScript tool allows you to pick a box and a spline in your 3ds Max scene and automatically create evenly spaced copies of the box along the spline path using a simple UI.

## ✨ Features

- Interactive UI with:
  - Box picker
  - Spline picker
  - Box count selector
- Automatically places box copies along a spline
- Boxes are evenly spaced based on parameter length (0.0 to 1.0)

## 🧰 Requirements

- Autodesk 3ds Max (any version supporting MaxScript)
- One `Box` object and one `Shape` (e.g. Line or Spline)

## 🛠️ Installation

1. Open 3ds Max.
2. Press `F11` or go to **Scripting > New Script**.
3. Paste the full script into the MaxScript editor.
4. Press `Ctrl + E` or click **Evaluate All** to run the script.

## 🧪 How to Use

1. Run the script to open the UI.
2. Click **"Pick Box"** and select a box object in the scene.
3. Click **"Pick Spline"** and select a shape (e.g. line, arc, or editable spline).
4. Set the number of boxes using the spinner.
5. Click **"Place Copies"** to create the boxes along the spline.
6. Click **"Close"** to exit the tool.

## ⚠️ Notes

- The spacing is based on spline parameterization, not real-world units.
- Make sure the spline is a single, continuous shape.
- All boxes are aligned based on the spline but do not rotate to follow its direction (rotation support could be added later).

