Feature: Post call example 

Scenario: Post call example 
	Given url 'https://reqres.in/api/users' 
	And request {"name": "morpheus","job": "leader"} 
	When method post 
	Then status 201