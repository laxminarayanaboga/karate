Feature: Learn usage of javascript in Karate 

Scenario: Usage of javascript functions 
	* def greeter = function(title, name) { return 'hello ' + title + ' ' + name }
	* def greetingBob = greeter('Mr.', 'Bob')
	* assert greetingBob == 'hello Mr. Bob'

Scenario:
Write complex javascript functions in multi-line format for better readability 
	* def dateStringToLong =
	"""
  function(s) {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    return sdf.parse(s).time; // '.getTime()' would also have worked instead of '.time'
  } 
  """
	* def timeInMillis = dateStringToLong("2016-12-24T03:39:21.081+0000") 
	* assert timeInMillis == 1482550761081
	

Scenario: a better example, with a JSON argument
* def greeter = function(name){ return 'Hello ' + name.first + ' ' + name.last + '!' }
* def greeting = call greeter { first: 'John', last: 'Smith' }
* assert greeting == 'Hello John Smith!'