Feature: Get Example using Karate 

Scenario: Get example using karate 
	Given url 'https://reqres.in/api/users?page=2' 
	When method GET 
	Then status 200