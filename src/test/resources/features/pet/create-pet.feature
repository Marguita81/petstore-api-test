@functional
Feature: Crear una nueva mascota PetStore

  Background:
    * url 'https://petstore.swagger.io/v2'
    * def randomId = Math.floor(Math.random() * 1000000)
    * def randomName = 'Pe-' + randomId

  Scenario: Crear una mascota con datos dinámicos
    Given path 'pet'
    And request
        """
        { "id": #(randomId),
          "name": "#(randomName)",
          "photoUrls": ["https://ejemplo.com/fojo.jpg"],
          "status": "available"
        }
        """
    When method Post
    Then status 200

      # Validaciones clave
    And match response.id == randomId
    And match response.name == randomName
    And match response.status == 'available'