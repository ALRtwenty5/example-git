Feature: Caso de Login

  @login
  Scenario: Caso Exitoso
    Given url urlBase
    And path '/api/login'
    And request {"email": #(correo), "password" : #(pass)}
    When method post
    Then status 200
    * def authToken = $.token


    @lo
  Scenario Outline: Caso Exitoso Outline
    Given url urlBase
    And path '/api/login'
    And request {"email": <correo>, "password" : <pass>}
    When method post
    Then status 200
    * print response

    Examples:
    |correo|pass|
    |abc@gmail.com|123456|


