Feature: E2E test flow

  Background:
    * url karate.properties['baseURL']
    * def functions = call read('classpath:karate-config.js')


  Scenario:  Update User

    # Update User updating the payload at runtime
    * def request_file_path =  searchFileAndReturnContent('updateUser.json')
    * def create_user_request = generateRequest(request_file_path)
    * print create_user_request
    * replace create_user_request.status = 'Inactive'
    * print create_user_request




