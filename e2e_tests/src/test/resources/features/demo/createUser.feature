Feature: Create User

  Background:
    * url karate.properties['baseURL']
    * def functions = call read('classpath:karate-config.js')

  @PositiveScenario
  Scenario: Create User
    * def request_file_path =  searchFileAndReturnContent('createUser.json')
    * def create_user_request = generateRequest(request_file_path)
    * print create_user_request
    Given path karate.properties['createuserpath']
    And headers getmyheaders()
    And request create_user_request
    When method post
    Then status 201
    * print response.id