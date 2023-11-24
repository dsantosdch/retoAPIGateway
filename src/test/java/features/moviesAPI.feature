Feature: Get pets details from the Pets API in AWS API Gateway

  Background:
    * url 'https://xe1qz10pw4.execute-api.us-east-2.amazonaws.com'
    * path '/movie'
    * def var = { "title": "<title>", "director": "<director>"}
    * def movieJson = karate.readAsString('classpath:movieJson.json')

  @GetAMovie
  Scenario Outline: Get a movie with the title <title> from the director <director> and a id <id>

    Given request var
    When method GET
    Then status 200
    And match response contains { "id": "<id>", "title": "<title>", "director": "<director>"}

    Examples:
  |id|title|director|
  |342323|Coraline|Tim Burton|
  |12345|Transformers|Michael Bay|

  @CreateMovie
  Scenario: Create a movie

    Given request movieJson
    When method PUT
    Then status 200
    And match response == '"Put item 45454"'
    * def textResponse = response
    * print textResponse
    * print movieJson




