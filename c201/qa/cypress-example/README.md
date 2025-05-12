# Cypress Demo

This project contains automated tests for the routes in `app201.py` using Cypress.

## Setup

To set up Cypress locally on a Mac, follow these steps:

1. Clone the repository: `git clone <repository-url>`
2. Navigate to the project directory: `cd cypress-demo`
3. Install the dependencies: `npm install`

## Running the Tests

To execute the tests, run the following command:

```bash
npx cypress run
```

This command will run all the Cypress tests and generate the test reports.

## Test Files

The project includes the following test files:

- `cypress/e2e/app201.cy.js`: Contains the Cypress tests for all routes in `app201.py`. It includes tests for `/201/cat`, `/201/dog`, and `/201/rabbit`. Each test asserts the JSON object data for the corresponding animal.

## Test Data

The project includes the following test data files:

- `cypress/fixtures/cat.json`: Contains the test data for the cat route. It includes the JSON object with properties `name`, `breed`, `age`, and `color` for a cat.
- `cypress/fixtures/dog.json`: Contains the test data for the dog route. It includes the JSON object with properties `name`, `breed`, `age`, and `color` for a dog.
- `cypress/fixtures/rabbit.json`: Contains the test data for the rabbit route. It includes the JSON object with properties `name`, `breed`, `age`, and `color` for a rabbit.

## Test Reporting

The project utilizes Mochawesome version 7.1.3 for reporting. After running the tests, the test reports can be found in the `mochawesome-report` directory.

```

Please make sure to replace `<repository-url>` with the actual URL of the repository where the project is hosted.