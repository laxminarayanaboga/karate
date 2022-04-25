Feature: Post call example 

Scenario: Post call example 
	Given url 'https://reqres.in/api/users' 
	And request {"name": "morpheus","job": "leader"} 
	When method post 
	Then status 201 
	
Scenario: Another way of writing the post call 
	Given url 'https://reqres.in' 
	And path 'api', 'users' 
	And request read('data/some-json.json') 
	When method post 
	Then status 201 
	# following steps are for response validation
	# single field validation
	* match response.name == 'morpheus' 
	# response verification using advanced matching operations
	* match response == {'name':'morpheus','job':'leader','id':'#present','createdAt':'#present'} 
	* match response == {'name':'morpheus','job':'leader','id':'#regex [0-9]{3}','createdAt':'#regex [0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\\.[0-9]{3}Z'}
	* match response contains {'name':'morpheus'}
	* match response contains {'job':'leader'}
	* match response contains {'job':'leader','name':'morpheus'}