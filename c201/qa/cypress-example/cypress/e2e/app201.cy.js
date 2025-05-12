describe('App201 Routes', () => {
  // beforeEach(() => {
  //   cy.visit('/');
  // });

  it('/201/cat - asserts json object data for a cat', () => {
    cy.fixture('cat.json').then((cat) => {
      cy.request('/201/cat').then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body).to.deep.equal(cat);
      });
    });
  });

  it('/201/dog - asserts json object data for a dog', () => {
    cy.fixture('dog.json').then((dog) => {
      cy.request('/201/dog').then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body).to.deep.equal(dog);
      });
    });
  });

  it('/201/rabbit - asserts json object data for a rabbit', () => {
    cy.fixture('rabbit.json').then((rabbit) => {
      cy.request('/201/rabbit').then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body).to.deep.equal(rabbit);
      });
    });
  });
});