Feature: Get Example using Karate

  Scenario: Get example using karate multiple tests
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match $.data.id == 2

  Scenario Outline: Get example using ScenarioOutline and Examples. userId: <userId>
    Given url 'https://reqres.in/api/users/<userId>'
    When method GET
    Then status 200
    And match $.data.id == <expectedUserId>
    Examples:
      | userId | expectedUserId |
      | 2      | 2              |
      | 3      | 3              |
      | 4      | 4              |
      | 5      | 5              |
      | 6      | 6              |
      | 7      | 7              |
      | 8      | 8              |
      | 9      | 9              |
      | 10     | 10             |

  @skipme
  Scenario Outline: Get example using delayed responed API
    Given url 'https://reqres.in/api/users?delay=<delay>'
    When method GET
    Then status 200
    And match $.page == <expectedUserId>
    Examples:
      | delay | expectedUserId |
      | 11    | 1              |
      | 1     | 1              |
      | 14    | 1              |
      | 5     | 1              |
      | 6     | 1              |
      | 7     | 1              |
      | 8     | 1              |
      | 9     | 1              |
      | 10    | 1              |