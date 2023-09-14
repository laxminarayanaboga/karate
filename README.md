# karate - API test automation

This is a sample Java project on how to use Karate test automation framework. 

Documentation: https://github.com/karatelabs/karate

Sample APIs: https://reqres.in/

# Running
command line: 
mvn test -Dtest=TestRunnerWithJunit5#testAll

detailed usage example: mvn test "-Dkarate.options=--tags ~@skipme classpath:demo/cats/cats.feature" -Dtest=DemoTestParallel

To Run Parallel: 
mvn test -Dtest=TestParallel#testParallel


