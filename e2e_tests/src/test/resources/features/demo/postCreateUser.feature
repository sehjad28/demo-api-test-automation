Feature: Create User post call

  Background:
    * url karate.properties['baseURL']
    * def functions = call read('classpath:karate-config.js')

  Scenario: Create User
    * def request_file_path =  searchFileAndReturnContent('createUser.json')
    * def create_user_request = generateRequest(request_file_path)
    * print create_user_request
    Given path karate.properties['createuserpath']
    And headers getmyheaders()
    And request create_user_request
    When method post
    Then status 201







