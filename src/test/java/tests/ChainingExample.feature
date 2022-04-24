Feature: Get Example using Karate 

# Create a new user, update the username with random string, validate if it is updated

Background: 
	* def random = function(max){ return Math.floor(Math.random() * max) + 1 }
	* def randomString = random(99999) + ''; 

@debug 
Scenario: Get example using karate multiple tests 
	Given url 'https://reqres.in/api/users' 
	And request { "name": "myTest #(randomString)","job": "leader" } 
	When method post 
	Then status 201 
	And def newUserId = $.id
	Given url 'https://reqres.in/api/users/#(newUserId)' 
	And request { "name": "myTest #(randomString)","job": "leader" } 
	When method put 
	Then status 200 