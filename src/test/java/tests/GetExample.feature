
Feature: Get Example using Karate

  Background:
    Given url baseURL

  Scenario: Get example using karate
    Given path 'users'
    And param page = 2
    When method GET
    Then status 200

  Scenario: Get example using karate - Schema validation
    And path 'users/2'
    And retry until responseStatus == 200
    When method GET
    Then status 200
    * def expectedResponseSchema = read('classpath:tests/responseSchema/getUser.json');
    * match response == expectedResponseSchema

  Scenario: Negative Scenario
    And path 'users/abcd'
    And retry until responseStatus == 404
    When method GET
    Then status 404
    * match response == {}