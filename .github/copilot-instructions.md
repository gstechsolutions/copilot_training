## `.github/copilot-instructions.md` 

# Coding Conventions for Copilot Training

This file outlines coding conventions and best practices for this project. GitHub Copilot will use these instructions when offering code suggestions.

## General Guidelines

*   **Descriptive Naming:** Use clear and descriptive names for variables, functions, classes, and modules. This enhances code readability and maintainability.

    *   Example: Instead of `x`, use `customer_name`  to represent a customer's name.

*   **Function Size:**  Write small, focused functions that perform a single, well-defined task. This improves code organization and makes functions easier to test and reuse.

*   **Named Constants:** Replace magic numbers with named constants. This makes code easier to understand and modify.

    *   Example: Instead of using `3.14` directly, define a constant `PI = 3.14`

*   **Docstrings:**  Provide clear and concise docstrings for all functions, classes, and modules. This explains what the code does, its parameters, and its return values.

    *   Example:
    ```python
    def calculate_area(radius):
        """Calculates the area of a circle.

        Args:
            radius: The radius of the circle.

        Returns:
            The area of the circle.
        """
        return PI * radius ** 2 
    ```

*   **List Comprehensions:**  Use list comprehensions for concise and efficient list manipulation when appropriate.

    *   Example: To create a list of squares of even numbers from 1 to 10, use:
    ```python
    even_squares = [x ** 2 for x in range(1, 11) if x % 2 == 0]
    ```

*   **Exception Handling:**  Handle exceptions gracefully and provide informative error messages. This helps in debugging and prevents abrupt program termination.

    *   Example:
    ```python
    try: 
        # Code that might raise an exception
    except ValueError as e:
        print(f"Invalid input: {e}")
    ```

*   **Avoid Deep Nesting:**  Minimize the nesting of code blocks to improve readability. Aim for a flatter code structure.


## Project-Specific Guidelines

*   [Include specific rules or conventions relevant to your project.]

*   [For example, specific libraries to use, logging practices, testing frameworks, etc.]


##  Additional Notes

*   Keep these instructions updated as the project evolves.
*   Encourage all contributors to follow these conventions to maintain code consistency and quality.

