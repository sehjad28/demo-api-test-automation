Feature: Test Sample Scenarios

  Background:
    * url karate.properties['baseURL']
    * def functions = call read('classpath:karate-config.js')
    * def id = '3333'
    * def scenariofilename = karate.info.featureFileName
    * print scenariofilename

  Scenario: Get User Details
    Given path karate.properties['path']
    And path id
    And headers getmyheaders()
    When method Get
    * print 'Constuctuted URL IS ---> ',karate.properties['baseURL'] + karate.properties['path']
    Then status 404
    * print response.message
    And match response.message == '#string'
    * karate.properties['isBaselineModeOn'] == 'true' ?	recordResponse(scenariofilename, karate.pretty(response)): ""



