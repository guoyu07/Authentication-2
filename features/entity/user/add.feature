@app @entity @user @add
Feature: Add users
  In order to add users
  As a system identity
  I should be able to send api requests related to users

  Background:
    Given I am authenticated as the "system" identity

  @createSchema @loadFixtures
  Scenario: Add a user
    When I add "Accept" header equal to "application/json"
    And I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "/users" with body:
    """
    {
      "username": "user1@site.com",
      "plainPassword":"1",
      "email": "user1@site.com",
      "enabled": true,
      "roles": [
          "ROLE_INDIVIDUAL"
      ],
      "owner": "BusinessUnit",
      "ownerUuid": "e3048503-19e2-4f68-9346-0398bb196748",
      "identity": "Individual",
      "identityUuid": "f78c7fd7-5afd-4d72-8a85-0248856dc727",
      "version": 1
    }
    """
    Then the response status code should be 201
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the response should be in JSON
    And the JSON node "id" should exist
    And the JSON node "id" should be equal to the number 3
    And the JSON node "uuid" should exist
    And the JSON node "createdAt" should exist
    And the JSON node "updatedAt" should exist
    And the JSON node "deletedAt" should exist
    And the JSON node "deletedAt" should be null
    And the JSON node "username" should exist
    And the JSON node "email" should exist
    And the JSON node "email" should be equal to the string "user1@site.com"
    And the JSON node "lastLogin" should exist
    And the JSON node "lastLogin" should be null
    And the JSON node "groups" should exist
    And the JSON node "roles" should exist
    And the JSON node "owner" should exist
    And the JSON node "owner" should be equal to the string "BusinessUnit"
    And the JSON node "ownerUuid" should exist
    And the JSON node "ownerUuid" should be equal to the string "e3048503-19e2-4f68-9346-0398bb196748"
    And the JSON node "identity" should exist
    And the JSON node "identity" should be equal to the string "Individual"
    And the JSON node "identityUuid" should exist
    And the JSON node "identityUuid" should be equal to the string "f78c7fd7-5afd-4d72-8a85-0248856dc727"
    And the JSON node "enabled" should exist
    And the JSON node "enabled" should be true
    And the JSON node "version" should exist
    And the JSON node "version" should be equal to the number 1

  @dropSchema
  Scenario: Read the added user
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "/users?username=user1@site.com"
    Then the response status code should be 200
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the response should be in JSON
    And the response should be a collection
    And the response collection should count 1 items
