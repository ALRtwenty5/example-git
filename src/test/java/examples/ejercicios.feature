Feature: Ejercicio Clase 4


  Scenario: Caso 1
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts/100'
    When method get
    Then status 200
    And match responseType == 'json'

    * print response
    And match $.id == 100

  Scenario: Caso 1.1
    * def var = 100
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts/' + id
    When method get
    Then status 200
    And match responseType == 'json'

    * print response
    And match $.id == 100


  Scenario: Caso 2
    Given url 'https://reqres.in'
    And path '/api/users'
    And param page = 2
    When method get
    Then status 200
    And match responseType == 'json'
    * print response
    And match $.data[2].id == 9
    And match $.data[2].email == 'tobias.funke@reqres.in'
    And match $.data[2].first_name == 'Tobias'
    And match $.data[2].last_name == 'Funke'

  Scenario: Caso 3 - Crear un usuario
    Given url 'https://reqres.in'
    And path '/api/users'
    And request {"name": "York", "job": "CL QE"}
    When method post
    Then status 201
    * print response
    And match $.name == 'York'
    And match $.job == 'CL QE'

  Scenario: Caso 4 - Crear un usuario con docString en variable
    * def body =
    """
    {
      "name": "Emiliano",
      "job": "Ingeniero"
    }
    """
    Given url 'https://reqres.in'
    And path '/api/users'
    And request body
    When method post
    Then status 201
    * print response
    And match $.name == 'Emiliano'
    And match $.job == 'Ingeniero'

  Scenario: Caso 5 - Crear un usuario con archivo json
    * def body =
    """
    {
      "name": "Emiliano",
      "job": "Ingeniero"
    }
    """
    Given url 'https://reqres.in'
    And path '/api/users'
    And request body
    When method post
    Then status 201
    * print response
    And match $.name == 'Emiliano'
    And match $.job == 'Ingeniero'

  Scenario: Caso 6 - Crear un usuario con archivo json
    Given url 'https://reqres.in'
    And path '/api/users'
    And request read("bodyUser.json")
    When method post
    Then status 201
    * print response
    And match $.name == 'Emiliano'
    And match $.job == 'Ingeniero'

    Scenario: Caso 7 - Login
      Given url 'https://reqres.in'
      And path '/api/login'
      And form field email = "eve.holt@reqres.in"
      And form field password = "cityslicka"
      When method post
      Then status 200
      * print response
      And match $.token == "#notnull"

    Scenario: Caso 8 - Actualizar
      * def id = 2
      Given url 'https://reqres.in'
      And path '/api/users/' + id
      And request read("bodyUser.json")
      When method put
      Then status 200
      * print response
      And match $.name == 'Emiliano'
      And match $.job == 'Ingeniero'
      And match $.updatedAt == "#notnull"