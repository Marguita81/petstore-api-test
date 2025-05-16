@functional
Feature: Obtener una mascota por ID desde Swagger PetStore

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Consultar una mascota existente por ID

    Given path 'pet', 1
    When method GET
    Then status 200
      #validacion de campos
    * print "El valor de status es ==> ", response.status
    And match response.id == 1
    And match response.name != null
    And match ['available', 'pending', 'sold'] contains response.status
       # And match response.status in ['available','pending','sold']