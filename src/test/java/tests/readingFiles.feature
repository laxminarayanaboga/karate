Feature: Reading external file 

Scenario: Reading json file
* def someJson = read('data/some-json.json')
* match someJson.name == 'morpheus'

#Scenario: Reading json file with classpath
#* def moreJson = read('classpath:data/some-json.json')
#* match moreJson.name == 'morpheus'
