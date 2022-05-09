describe('example to-do app', () => {
  it("should visit root", () => {
    cy.visit("/")
  })

  it("should see 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should add an item to the cart", () => {
    cy.contains("Add").first().click({force: true})
    cy.contains("My Cart (1)")
  })
})
