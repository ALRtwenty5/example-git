Feature: Ejercicios DataDriven

  Background: : Caso Prueba
    * def responseLogin = call read('login.feature@login') {correo: "eve.holt@reqres.in", pass: "cityslicka"})
    * def token = responseLogin.authToken
    * header Authorization = token
    * url urlBase

  Scenario: Listado de Usuarios
    Given path '/api/users'
    When method get
    Then status 200git add

  Scenario: Crear un usuario
    Given path '/api/users'
    And request {"name": "Emiliano", "job": "QEngineer"}
    When method post
    Then status 201
    * print response
    And match response == {id: #string, name: "#string", job: "#string", createdAt: "#string"}
    And match $.name == "Emiliano"

  Scenario Outline: Crear usuario con .csv <name>
    Given path '/api/users'
    And request {"name": <name>, "job": <job>}
    When method post
    Then status 201

    Examples:
    |read('classpath:examples/dataDriven/dataUSer.csv')|

    @setup
    Scenario: Data
      * def data = read('classpath:examples/dataDriven/data.json')

  Scenario Outline: Listar usuarios con JSON <name>
    Given path '/api/users/' + <id>
    When method get
    Then status 200

    Examples:
      |karate.setup().data|

  Scenario Outline: Listar usuarios con JSON simple <name>
    Given path '/api/users/' + <id>
    When method get
    Then status 200

    Examples:
      |read('classpath:examples/dataDriven/data.json')|



  @pending
    Scenario: Crear un usuario dinámico
      Given path '/api/users/'
      And request read('bodyUserDinamic.json') {"nombre": "Alejandro", "profesion": "Ingeniero"}
      When method post
      Then status 201


