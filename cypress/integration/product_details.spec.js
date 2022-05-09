describe('example to-do app', () => {
  it("should visit root", () => {
    cy.visit("/")
  })
  
  it("should navigate to a product detail page", () => {
    cy.contains("Giant Tea").click();
    cy.contains("in stock")
  });
})


