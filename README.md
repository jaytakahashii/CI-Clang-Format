# Clang Format Check Action

A GitHub Action to validate the formatting of your C++ code against a specified `clang-format` style. This ensures your code adheres to a consistent coding standard before merging or deployment.

---

## Features

- Automatically checks C++ files (`*.cpp`, `*.h`, and `*.hpp`) for proper formatting.
- Supports popular predefined styles such as `Google`, `LLVM`, `Mozilla`, and more.
- Allows for custom styles by specifying your own `.clang-format` file.
- Easy integration with GitHub workflows.

---

## Inputs

| Name    | Description                                                                           | Required | Default  |
| ------- | ------------------------------------------------------------------------------------- | -------- | -------- |
| `path`  | Directory to check for `.cpp`, `.h`, and `.hpp` files.                                | Yes      | `src`    |
| `style` | Clang format style to use. Supports predefined styles like `Google` or custom styles. | No       | `Google` |

---

## Outputs

| Name      | Description                          |
| --------- | ------------------------------------ |
| `success` | Whether the formatting check passed. |

---

## Predefined Styles

| Style       | Description                                                                                  |
| ----------- | -------------------------------------------------------------------------------------------- |
| `Google`    | Google's recommended C++ coding style. Widely used for its simplicity and readability.       |
| `LLVM`      | The coding style used by the LLVM project. Ideal for compiler and toolchain development.     |
| `Mozilla`   | Used in Mozilla projects like Firefox. Commonly employed in C++ and JavaScript projects.     |
| `Chromium`  | Google's Chromium project coding style.                                                      |
| `WebKit`    | The style used in WebKit-based projects such as Safari.                                      |
| `Microsoft` | Microsoft's recommended C++ coding style.                                                    |
| `GNU`       | The style used by the GNU project. Widely adopted in free software projects.                 |
| `Custom`    | Define your own style using a `.clang-format` file for fine-grained control over formatting. |

For more details, refer to the [clang-format documentation](https://clang.llvm.org/docs/ClangFormat.html).

---

## Example Workflows

### Basic Usage

```yaml
name: Clang Format Check

on: [push, pull_request]

jobs:
  format-check:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Run Clang Format Check
        uses: jaytakahashii/clang-format-check@v3
        with:
          path: "src"
          style: "Google"
```

### Using a Custom `.clang-format` File

If you want to use a custom style, include a `.clang-format` file in the root of your repository:

```yaml
name: Custom Clang Format Check

on: [push, pull_request]

jobs:
  format-check:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Run Clang Format Check with Custom Style
        uses: jaytakahashii/clang-format-check@v3
        with:
          path: "src"
          style: "Google" # This style will be ignored if a .clang-format file is present
```

### Check Multiple Directories

```yml
name: Multi-Directory Clang Format Check

on: [push, pull_request]

jobs:
  format-check:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        path:
          - "src"
          - "examples"
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Run Clang Format Check
        uses: jaytakahashii/clang-format-check@v3
        with:
          path: "${{ matrix.path }}"
          style: "Google"
```

## Contributing

We welcome contributions to improve this action. Feel free to submit a pull request or open an issue with suggestions.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
