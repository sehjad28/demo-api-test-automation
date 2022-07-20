Feature: E2E test flow

  Background:
    * url karate.properties['baseURL']
    * def functions = call read('classpath:karate-config.js')

  @PositiveScenario
  Scenario:  E2E test flow - create/delete/get
    # create user using postCreateUser.feature file call
    * def createUserResponse = call read('classpath:features/demo/postCreateUser.feature')
    * print 'Calling Post Create feature file ---> ', createUserResponse
    * print createUserResponse.responseHeaders.Connection[0]
    * def createUserResponse = createUserResponse.response
    * print createUserResponse

    # Delete User
    Given path karate.properties['path'], createUserResponse.id
    And headers getmyheaders()
    When method Delete
    Then status 204

    # Get User Details
    Given path karate.properties['path']
    And path createUserResponse.id
    And headers getmyheaders()
    When method Get
    Then status 404

    # Some additional features
    And assert responseStatus == 404 || responseStatus == 400
    * match response.message == 'Resource not found'
    * if (responseStatus == 404) karate.call('test.feature')
    * def result = response.message == 'Resource not found' ? "Equal" : "Unequal"
    * print result

  @PositiveScenario
  Scenario:  E2E test - create/update/delete user
    # create user using postCreateUser.feature file call
    * def createUserResponse = call read('classpath:features/demo/postCreateUser.feature')
    * print 'Calling Post Create feature file ---> ', createUserResponse
    * print createUserResponse.responseHeaders.Connection[0]
    * def createUserResponse = createUserResponse.response
    * print createUserResponse

    # Update User
    * def request_file_path =  searchFileAndReturnContent('updateUser.json')
    * def update_user_request = generateRequest(request_file_path)
    * replace update_user_request.status = 'Inactive'
    * print update_user_request
    Given path karate.properties['path'], createUserResponse.id
    And headers getmyheaders()
    And request update_user_request
    When method Put
    Then status 200

    # Delete User
    Given path karate.properties['path'], createUserResponse.id
    And headers getmyheaders()
    When method Delete
    Then status 204

    # Get User
    Given path karate.properties['path']
    And path createUserResponse.id
    And headers getmyheaders()
    When method Get
    Then status 404





