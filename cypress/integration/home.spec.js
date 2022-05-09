
describe('example to-do app', () => {
  it("should visit root", () => {
    cy.visit("/")
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})
