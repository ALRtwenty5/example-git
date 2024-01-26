Feature: Posts
  @ex1
  Scenario: Caso 1
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts/100'
    When method get
    Then status 200

  Scenario: Caso 2
      * def id = 50
      Given url 'https://jsonplaceholder.typicode.com'
      And path '/posts/' + id
      When method get
      Then status 200
      * print response