Feature: Post call example 

@debug 
Scenario: Post call example 
	Given url 'https://reqres.in/api/users' 
	And request {"name": "morpheus","job": "leader"} 
	When method post 
	Then status 201