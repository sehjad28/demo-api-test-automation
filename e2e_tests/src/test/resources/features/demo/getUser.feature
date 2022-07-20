Feature: Get User Details

  Background:
    * url karate.properties['baseURL']
    * def functions = call read('classpath:karate-config.js')
    * def id = '3333'

  Scenario: Get User Details
    Given path karate.properties['path']
    And path id
    And headers getmyheaders()
    When method Get
    * print 'Constuctuted URL IS ---> ',karate.properties['baseURL'] + karate.properties['path']
    Then status 404



