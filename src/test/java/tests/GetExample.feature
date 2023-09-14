@debug
Feature: Get Example using Karate

  Scenario: Get example using karate
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200

  Scenario: Get example using karate - Schema validation
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    * def expectedResponseSchema = read('classpath:tests/responseSchema/getUser.json');
    * match response == expectedResponseSchema