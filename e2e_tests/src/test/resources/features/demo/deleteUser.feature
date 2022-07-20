Feature: Delete User

  Background:
    * url karate.properties['baseURL']
    * def functions = call read('classpath:karate-config.js')

  Scenario: Delete User
    * def createUserResponse = call read('classpath:features/demo/postCreateUser.feature')
    * def createUserResponse = createUserResponse.response
    * print '******************'
    * print createUserResponse.id
    Given path karate.properties['path'], createUserResponse.id
    And headers getmyheaders()
    When method Delete
    Then status 204
